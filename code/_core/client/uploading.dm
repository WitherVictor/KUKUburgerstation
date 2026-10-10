#define FILE_SIZE_LIMIT 8

/client/AllowUpload(filename,filelength)

	if(filelength > FILE_SIZE_LIMIT*1000) //This is in bytes
		to_chat(span("warning","[filename] 太大，无法上传！大小限制：[FILE_SIZE_LIMIT] KB，文件大小：[CEILING(filelength/1000,1)] KB。"))
		return FALSE

	. = ..()

/client/proc/upload_icon()

	if(!icon_request_details["width_limit"] || !icon_request_details["height_limit"])
		return FALSE

	var/icon/desired_file = input("选择要上传为喷漆图案的图像。尺寸必须小于 [icon_request_details["width_limit"]]×[icon_request_details["height_limit"]] 像素，文件大小必须小于 [FILE_SIZE_LIMIT] KB。","上传喷漆图案") as null|icon

	if(!icon_request_details || !icon_request_details["proc"] || !icon_request_details["proc_src"])
		icon_request_details.Cut()
		icon_request_details = null
		return FALSE

	if(!desired_file)
		icon_request_details.Cut()
		icon_request_details = null
		return FALSE

	desired_file = new/icon(desired_file)

	var/icon_height = desired_file.Height()
	var/icon_width = desired_file.Width()

	if(!icon_height || !icon_width)
		to_chat(span("warning","文件上传失败：读取文件时出错。"))
		return FALSE

	if(icon_request_details["width_limit"] && icon_request_details["height_limit"] && (icon_request_details["width_limit"] < icon_width || icon_request_details["height_limit"] < icon_height))
		to_chat(span("warning","文件上传失败：最大尺寸为 [icon_request_details["width_limit"]]×[icon_request_details["height_limit"]] 像素。"))
		icon_request_details.Cut()
		icon_request_details = null
		return FALSE

	call(icon_request_details["proc_src"],icon_request_details["proc"])(src,desired_file)
	icon_request_details.Cut()
	icon_request_details = null

	return TRUE
