<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.net.*"%>
<%@ page import="com.wanghong.util.Base64"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
<title>下载</title>
</head>
<body>
	<%
		String sys = request.getParameter("identity");
		String filePath = new String(request.getParameter("path").getBytes("8859_1"), "UTF-8");
		if (filePath != null && !"".equals(filePath)) {
			filePath = sys +  filePath;
			System.out.println("@@@@@@@@@@@@@@@@@"+filePath);
			File file = new File(filePath);
			if (!file.exists()) {
				out.println("无文件");
			} else {
				InputStream inStream = null;
				ServletOutputStream outStream = null;
				try {
					String[] nameArray = filePath.split("/");
					inStream = new FileInputStream(filePath);
					String name = nameArray[nameArray.length - 1];
					name = URLEncoder.encode(name, "UTF-8");
					//设置输出的格式 
					response.reset();
					response.setContentType("application/x-download;charset=UTF-8");
					response.addHeader("Content-Disposition", "attachment; filename=" + name);
					//循环取出流中的数据 
					byte[] b = new byte[1024];
					int len;
					outStream = response.getOutputStream();
					while ((len = inStream.read(b)) > 0)
						outStream.write(b, 0, len);
					out.clear();
					out = pageContext.pushBody();
				} catch (Exception e) {
					e.printStackTrace();
				}finally{
					if(outStream != null){
						outStream.flush();
						outStream.close();
					}
					if(inStream != null) {
						inStream.close();
					}
				}
			}
		}
	%>
</body>
</html>