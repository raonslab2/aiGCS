function readExcel() {
    let input = event.target,
        reader = new FileReader();
    reader.onload = function () {
        let data = reader.result;
        let workBook = XLSX.read(data, { type: 'binary' });
        workBook.SheetNames.forEach(function (sheetName) {
            console.log('SheetName: ' + sheetName);
            let rows = XLSX.utils.sheet_to_json(workBook.Sheets[sheetName]);
            console.log(JSON.stringify(rows));
        })
    };
    reader.readAsBinaryString(input.files[0]);
};


//엑셀
// var test1 = null, test2 = null;
// function gridExcelToWeb(file, target){
//     var reader = new FileReader();

//     reader.onload = function (evt) {
//         if (evt.target.readyState == FileReader.DONE) {
//             var data = evt.target.result;  //해당 데이터, 웹 서버에서 ajax같은거로 가져온 blob 형태의 데이터를 넣어주어도 동작 한다.
//             data = new Uint8Array(data);
//             var workbook = XLSX.read(data, { type: 'array' });
//             var sheetName = '';
//             workbook.SheetNames.forEach( function(data, idx){   //시트 여러개라면 이 안에서 반복문을 통해 돌리면 된다.
//                 if(idx == 0){
//                     sheetName = data;
//                 }
//             });
//             test1 = workbook;

//             var toHtml = XLSX.utils.sheet_to_html(workbook.Sheets[sheetName], { header: '' });

//             target.html(toHtml);
//             target.find('table').attr({class:'table table-bordered',id:'excelResult'});  //id나 class같은거를 줄 수 있다.
//             test2 = toHtml;
//             $('#excelResult').find('tr').each(function(idx){
//                 if(idx <1 ){ 
//                     $(this).css({'background-color':'#f8dee0', 'border-bottom': '1px solid #de979d'});
//                 }
//             });
//         }
//     };
//     reader.readAsArrayBuffer(file);
// }  

// $('#execl_select').change( function(){
//     const selectedFile = $(this)[0].files[0];
//     gridExcelToWeb(selectedFile,  $('#excel_charge'))
// });