const {chromium}=require('playwright');const path=require('path');
(async()=>{const b=await chromium.launch();const p=await b.newPage();
for(let i=2;i<process.argv.length;i+=2){await p.goto('file://'+path.resolve(process.argv[i]));
await p.pdf({path:process.argv[i+1],format:'A4',printBackground:true,displayHeaderFooter:true,headerTemplate:'<span></span>',footerTemplate:'<div style="font-size:8px;width:100%;text-align:center;color:#888">Ricerca casa – pag. <span class="pageNumber"></span>/<span class="totalPages"></span></div>',margin:{top:'16mm',bottom:'16mm',left:'14mm',right:'14mm'}});}
await b.close();})();
