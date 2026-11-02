'use strict';
(async function(){
  const status=document.getElementById('module-loader-status');
  const read=async url=>{const response=await fetch(url,{cache:'no-cache'});if(!response.ok)throw new Error(url+' returned HTTP '+response.status);return response.text()};
  try{
    const [layout,manifestText]=await Promise.all([read('packages/layout.html'),read('packages/manifest.json')]);
    document.getElementById('orchestra-root').innerHTML=layout;
    const manifest=JSON.parse(manifestText);
    if(!window.ORC_SAMPLES)throw new Error('Instrument sample script failed. Check https://okankaplanedu.github.io/w/orkestra/script.js and your internet connection.');
    const moduleTexts=await Promise.all(manifest.modules.map(async entry=>{
      let text=await read(entry.template);
      const bodies=await Promise.all(entry.functions.map(part=>read(part.file)));
      entry.functions.forEach((part,index)=>{if(text.split(part.marker).length!==2)throw new Error('Missing or repeated marker '+part.marker);text=text.replace(part.marker,()=>bodies[index]);});
      return text;
    }));
    for(let i=0;i<moduleTexts.length;i++){
      status.textContent=`Loading orchestra module ${i+1} of ${moduleTexts.length}…`;
      await new Promise((resolve,reject)=>{const u=URL.createObjectURL(new Blob([moduleTexts[i]],{type:'text/javascript'})),s=document.createElement('script');s.src=u;s.onload=()=>{URL.revokeObjectURL(u);resolve()};s.onerror=()=>{URL.revokeObjectURL(u);reject(new Error('Module '+(i+1)+' could not be loaded'))};document.body.appendChild(s)});
    }
    // The legacy player and keyboard register two window-load handlers. When the
    // modules are fetched after the browser load event, replay that event once so
    // the original player boots and sample loading begins. Avoid a double boot
    // if the original event has already initialised the score.
    if(window.Player && !window.Player.state.score)window.dispatchEvent(new Event('load'));
    status.remove();window.dispatchEvent(new Event('orchestra-modules-ready'));
  }catch(error){status.style.background='#672f2c';status.textContent='Orchestra package error: '+error.message+' — Run a local web server and make sure every package file is present.';console.error(error)}
})();
