package com.xiao.controller;

import com.xiao.domain.Book;
import com.xiao.domain.UserInfo;
import com.xiao.service.BookService;
import com.xiao.service.ICategoryService;
import com.xiao.service.IUserService;
import com.xiao.utils.DateUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/export")
@Transactional
public class ExportExcelController {

    @Autowired
    private BookService bookService;
    @Autowired
    private IUserService userService;
    @Autowired
    private ICategoryService categoryService;

    /**
     * 导出图书信息excel表格
     * @param response
     */
    @RequestMapping("/exportExcelByBook.do")
    public void export(HttpServletResponse response) {

        List<Book> books = bookService.findAll();
        HSSFWorkbook wk = new HSSFWorkbook();
        HSSFSheet sheet = wk.createSheet("图书信息表");
        for (int i = 0; i < 9; i++) {
            sheet.setColumnWidth(i, 3000);
        }

        HSSFRow row1 = sheet.createRow(0);
        HSSFCell cell = row1.createCell(0);
        cell.setCellValue("图书信息表");
        sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 9));
        HSSFRow row2 = sheet.createRow(1);
        row2.createCell(0).setCellValue("ISBN");
        row2.createCell(1).setCellValue("图书名称");
        row2.createCell(2).setCellValue("价格");
        row2.createCell(3).setCellValue("出版社");
        row2.createCell(4).setCellValue("作者");
        row2.createCell(5).setCellValue("类别");
        row2.createCell(6).setCellValue("出版年份");
        row2.createCell(7).setCellValue("库存");
        row2.createCell(8).setCellValue("入库时间");
        row2.createCell(9).setCellValue("借出数量");

        for (int i = 0; i < books.size(); i++) {
            HSSFRow row = sheet.createRow(i + 2);
            if(books.get(i).getBook_isbn() != null){
                row.createCell(0).setCellValue(books.get(i).getBook_isbn());
            }
            if(books.get(i).getBook_name() != null){
                row.createCell(1).setCellValue(books.get(i).getBook_name());
            }
            if(books.get(i).getBook_price() != null){
                row.createCell(2).setCellValue(books.get(i).getBook_price());
            }
            if(books.get(i).getBook_public() != null){
                row.createCell(3).setCellValue(books.get(i).getBook_public());
            }
            if(books.get(i).getBook_author() != null){
                row.createCell(4).setCellValue(books.get(i).getBook_author());
            }
//            if(books.get(i).getCategory().getC_name() != null){
//                row.createCell(5).setCellValue(books.get(i).getCategory().getC_name());
//            }
            if(books.get(i).getBook_year() != null){
                row.createCell(6).setCellValue(books.get(i).getBook_year());
            }
            row.createCell(7).setCellValue(books.get(i).getBook_count());
            row.createCell(8).setCellValue(books.get(i).getBookDateStr());
            row.createCell(9).setCellValue(books.get(i).getBook_borrow());
        }
        try {
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String str = sdf.format(date);
            response.setContentType("application/octet-stream");
            response.setHeader("Content-disposition", "attachment;filename=" + str + ".xls");
            response.flushBuffer();
            wk.write(response.getOutputStream());
            wk.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 导出用户信息excel表格
     * @param response
     * @throws Exception
     */
    @RequestMapping("/exportExcelByUser.do")
    public void exportByUser(HttpServletResponse response) throws Exception {

        List<UserInfo> users = userService.findAll();
        HSSFWorkbook wk = new HSSFWorkbook();
        HSSFSheet sheet = wk.createSheet("用户表");
        for (int i = 0; i < 6; i++) {
            sheet.setColumnWidth(i, 3000);
        }

        HSSFRow row1 = sheet.createRow(0);
        HSSFCell cell = row1.createCell(0);
        cell.setCellValue("所有用户表");
        sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 6));
        HSSFRow row2 = sheet.createRow(1);
        row2.createCell(0).setCellValue("id");
        row2.createCell(1).setCellValue("用户名");
        row2.createCell(2).setCellValue("联系方式");
        row2.createCell(3).setCellValue("用户状态");
        row2.createCell(4).setCellValue("创建时间");
        row2.createCell(5).setCellValue("用户角色");

        for (int i = 0; i < users.size(); i++) {
            HSSFRow row = sheet.createRow(i + 2);
            row.createCell(0).setCellValue(users.get(i).getId());
            row.createCell(1).setCellValue(users.get(i).getUsername());
            row.createCell(2).setCellValue(users.get(i).getPhoneNum());
            row.createCell(3).setCellValue(users.get(i).getStatusStr());
            row.createCell(4).setCellValue(users.get(i).getCreateTimeStr());
            row.createCell(5).setCellValue(users.get(i).getRoles().get(0).getRoleDesc());
        }
        try {
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String str = sdf.format(date);
            response.setContentType("application/octet-stream");
            response.setHeader("Content-disposition", "attachment;filename=" + str + ".xls");
            response.flushBuffer();
            wk.write(response.getOutputStream());
            wk.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 业务：图书购入（excel上传）
     * 上传excel表
     * @param excelFile
     * @return
     * @throws IOException
     */
    @RequestMapping("/lead.do")
    public ModelAndView lead(MultipartFile excelFile) throws IOException {
        System.out.println("----------------------进入了--------------------");
        ModelAndView mv = new ModelAndView();
        Random random = new Random();
        //上传到本地（保存记录）
        if(StringUtils.isNotBlank(excelFile.getOriginalFilename())){
            String oldName = excelFile.getOriginalFilename();
            String newName = String.valueOf(random.nextInt(64));
            String date = DateUtils.date2String(new Date(),"yyyy-MM-dd");
            String fileName = newName + date;
            String sux = oldName.substring(oldName.lastIndexOf("."));
            File file = new File("E:\\bookAd\\excel\\" + fileName + sux);
            excelFile.transferTo(file);
            //进行解析
            try {
                FileInputStream eFile = new FileInputStream("E:\\bookAd\\excel\\" + fileName + sux);
                Workbook wb = new HSSFWorkbook(eFile);
                Sheet sheet = wb.getSheetAt(0);
                List<Book> books = new ArrayList<>();

                for(Row row : sheet){
                    if(row == null){
                        continue;
                    }
                    if(row.getRowNum() == 0){
                        continue;
                    }


                    //标记这本书是否已有
//                    boolean flag = false;


                    if(row.getCell(0) != null){
                        //当isbn存在时才会有下面的

                        Book book = new Book();

                        System.out.println("============row:" + row.getRowNum());
                        String isbn = row.getCell(0).toString();
                        System.out.println("---------------------:" + isbn);
                        String s = row.getCell(7).toString();
                        float v = Float.parseFloat(s);
                        int count = (int) v;


//                      String isbn = row.getCell(0).toString();
                        System.out.println(isbn);
                        book.setBook_isbn(isbn);
//                        String s = row.getCell(7).toString();
//                        float v = Float.parseFloat(s);
//                        int count = (int) v;
//                        book.setBook_count(count);
//                        Book byId = bookService.findById(isbn);
                        //如果重复
//                        flag = true;
//                        if(byId != null){
//                            bookService.updateCountById(isbn,count);
//                        }





                        if(row.getCell(1) != null){
                            String name = row.getCell(1).toString();
                            System.out.println("++++++++++++:" + name);
                            book.setBook_name(name);
                        }
                        if(row.getCell(2) != null){
                            String price = row.getCell(2).toString();
                            book.setBook_price(price);
                        }
                        if(row.getCell(3) != null){
                            String book_public = row.getCell(3).toString();
                            System.out.println("++++++++++++++:" + book_public);
                            book.setBook_public(book_public);
                        }
                        if(row.getCell(4) != null){
                            String author = row.getCell(4).toString();
                            book.setBook_author(author);
                        }
                        if(row.getCell(5) != null){
                            String category = row.getCell(5).toString();
                            System.out.println("++++++++++++:" + category);
                            int categoryId = categoryService.findByName(category);
                            book.setC_id(categoryId);
                        }
                        if(row.getCell(6) != null){
//                        Cell cell = row.getCell(6);
//                        if(DateUtil.isCellDateFormatted(cell)){
//                            Date dateCellValue = cell.getDateCellValue();
//                            String yearDate = DateUtils.date2String(dateCellValue, "yyyy");
//                            book.setBook_year(yearDate);
//                        }else{
                            String year = row.getCell(6).toString();
                            book.setBook_year(year);
//                        }
                        }
                        //在前面实现
                        if(row.getCell(7) != null){
                            System.out.println(count);
                            book.setBook_count(count);
                        }
                        book.setOut(1);
                        books.add(book);
                        //存入数据库中
                        //存在相同的isbn
                        //从数据库中查找有无与该书相同的，如果相同则+1
                        Book byId = bookService.findById(isbn);
                        if(byId == null){
                            bookService.save(book);
                        }else{
                            //+1
                            bookService.updateCountById(isbn,count);
                        }
                    }


//                    for(Cell cell : row){
//                        if(cell == null){
//                            continue;
//                        }
//                        System.out.println("============|" + getStringCell(cell));
//                    }
//                    for (int i = 1; i < 8; i++) {
////                        if(row.getCell(i) == null){
////                            continue;
////                        }
////                        System.out.println(row.getCell(i));
////                        System.out.println("============|" + getStringCell(row.getCell(i)));
//                    }
                }
                for(Book b : books){
                    System.out.println(b.toString());
                }
                mv.addObject("books",books);
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        //返回页面
        mv.setViewName("book-lead-list");
        return mv;
    }

//    private static String getStringCell(Cell cell){
//        String result = "";
//        int cellType = cell.getCellType();
//        switch (cellType){
//            case Cell.CELL_TYPE_BOOLEAN:
//                result = String.valueOf(cell.getBooleanCellValue());
//                break;
//            case Cell.CELL_TYPE_NUMERIC:
//                result = String.valueOf(cell.getDateCellValue());
//                break;
//            case Cell.CELL_TYPE_STRING:
//                result = cell.getStringCellValue();
//                break;
//            default:
//                break;
//        }
//        return result;
//    }
}
