package com.tjs.web.utils;
import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.tjs.admin.system.utils.FileUtil;
 
public class QRCodeUtils {
	
	private static final Logger logger = Logger.getLogger(QRCodeUtils.class);
	/**logo 图片是占总图片的几分之一**/
	private static final int LOGO_RATIO = 5;
	private QRCodeUtils() {
		
	}
	/***
	 * 生成二维码
	 * @param ot 输出流
	 * @param url 图片的URL地址
	 * @param size 图片的大小
	 * @throws Exception 
	 */
	public static void generateQRCode(OutputStream ot, String url,int size) throws Exception {
		MultiFormatWriter multiFormatWriter = new MultiFormatWriter();
		Map<EncodeHintType,String> hints = new HashMap<EncodeHintType,String>();
		hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
		BitMatrix bitMatrix;
		try {
			bitMatrix = multiFormatWriter.encode(url, BarcodeFormat.QR_CODE,
					size, size, hints);
			MatrixToImageWriter.writeToStream(bitMatrix, "jpg", ot);
		} catch (Exception e) {
			logger.error(e, new Exception("generateQRCode error!"));
			throw new Exception(e.getMessage());
		}
	}
	
	/***
	 * 生成二维码
	 * @param ot 输出流
	 * @param url 二维码的地址
	 * @param logoPath logo图片的地址
	 * @param size
	 * @throws Exception 
	 */
	public static void generateQRCode(OutputStream ot, String url,String logoPath,int size) throws Exception {
		MultiFormatWriter multiFormatWriter = new MultiFormatWriter();
		Map<EncodeHintType,String> hints = new HashMap<EncodeHintType,String>();
		hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
		BitMatrix bitMatrix;
		try {
			bitMatrix = multiFormatWriter.encode(url, BarcodeFormat.QR_CODE,
					size, size);
			String sysPath = FileUtil.getSystemPath();
			FileUtil.fileDirMake(sysPath);
			String imagePath = sysPath + "/"+ UUID.randomUUID()+ ".jpg";
			MatrixToImageWriter.writeToFile(bitMatrix, "jpg", new File(imagePath));
			setLogoImage(imagePath,logoPath,ot);
			FileUtils.deleteQuietly(new File(imagePath));
		} catch (Exception e) {
			logger.error(e, new Exception("generateQRCode error!"));
			throw new Exception(e.getMessage());
		}
	}
	
	private static void setLogoImage(String imagePath,String logoPath,OutputStream ot) throws IOException{
		BufferedImage logo = ImageIO.read(new File(logoPath));
		BufferedImage image = ImageIO.read(new File(imagePath));
		Graphics2D g = image.createGraphics();
		// 考虑到logo照片贴到二维码中，建议大小不要超过二维码的1/5;
		int oldWidth = logo.getWidth();
		int oldHeight = logo.getHeight();
		int width = image.getWidth() / LOGO_RATIO;
		int height = image.getHeight() / LOGO_RATIO;
		width = width > oldWidth ? oldWidth : width;
		height = height > oldHeight ? oldHeight : height;
		// logo起始位置，应该为  总大小-logo图片大小 除以2
		int x = (image.getWidth() - width) / 2;
		int y = (image.getHeight() - height) / 2;
		// 绘制图
		g.drawImage(logo, x, y, width, height, null);
		// 给logo画边框
		g.setStroke(new BasicStroke(1));//边框大小
		g.setColor(Color.WHITE);//边框颜色
		g.drawRect(x, y, width, height);
		g.dispose();
		// 写入logo照片到二维码
		ImageIO.write(image, "jpg", ot);
	}
	
	
	
	public static void main(String[] args){
		File file = new File("c://info.jpg");
		OutputStream ot;
		try {
			ot = new FileOutputStream(file);
			QRCodeUtils.generateQRCode(ot,
					"http://192.168.2.52/phoneUserHome.do",
					"D:/work/duoduo-licai/duoduo-licai-show/src/main/webapp/WEB-INF/config/ddzf.jpg",
					300);
			ot.flush();
			ot.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
