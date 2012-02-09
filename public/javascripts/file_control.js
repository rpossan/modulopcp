/**
 * @author fiberwork
 * @author Marcelo F. Rigon
 */

var file_accept_info = {
	extension: {
			image:["png", "jpg", "jpeg", "gif"]
		},
	types: {
			test_data:["application/vnd.ms-excel", "text/plain", "text/css", "application/xml"],
			test_sor:["application/vnd.ms-excel", "text/plain", "text/css", "application/xml"],
			image:["image/png", "image/jpeg"]
		},
	sizes: {
			test_data: 500*1024,
			test_sor: 500*1024,
			image: 500*1024
		}
	};

function get_max_size(file_type){
	return file_accept_info.sizes[file_type];
}

function acceptFile(file_type, file_path){
	split_path = file_path.split('.');
	file_name = file_path.match(/[^/\\]+[.][a-z]{2,4}/gi)[0];

	if (file_accept_info.extension[file_type].indexOf(split_path[split_path.length -1].toLowerCase()) >= 0) {
		return true;
	}
	Ext.Msg.alert("Invalid File Format!","The only accepted formats are: "+file_accept_info.extension[file_type]);
	return false;
}

function validFiles () {
	var files = document.getElementById(this.getFileInputId()).files;
	var file;
	if (files.length > 0) {
		file = files[0];
		if (file_accept_info.types[file_type].indexOf(file.type) < 0) {
			this.setValue("");
			Ext.Msg.alert("File Upload","Invalid file format, file must be in 'CSV' or 'TXT' format!");
			return false;
		}
	}
	return true;
}