package com.example.server.utils;

import com.example.server.entity.Employee;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class UserUtil {

    private static void createUser(int count) throws Exception {
        int[] nIds = {1, 2, 3, 4};
        int[] psIds = {1, 2};
        int[] dIds = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13};
        int[] jIds = {1, 2, 3, 4};
        int[] pIds = {1, 2, 3};
        Random random = new Random();
        List<Employee> users = new ArrayList<>();
        for (int i = 0; i < count; i++) {
            Employee user = new Employee();
            user.setName("员工" + i * 1000);
            user.setGender("女");
            user.setBirthday(LocalDate.now());
            user.setIdCard("410xxx19xx0101xxxx");
            user.setNationId(nIds[random.nextInt(nIds.length)]);
            user.setNativePlace("郑州");
            user.setPoliticId(psIds[random.nextInt(psIds.length)]);
            user.setEmail(random.nextInt(10000) + "@xxxx.com");
            user.setPhone("1300000xxxx");
            user.setAddress("地址");
            user.setDepartmentId(dIds[random.nextInt(dIds.length)]);
            user.setJobLevelId(jIds[random.nextInt(jIds.length)]);
            user.setPosId(pIds[random.nextInt(pIds.length)]);
            user.setEngageForm("全职");
            user.setTiptopDegree("高中");
            user.setSpecialty("某专业");
            user.setSchool("某学校");
            user.setBeginDate(LocalDate.now());
            user.setWorkState("在职");
            user.setWorkId(10000000 + i);
            user.setContractTerm(9.31);
            user.setConversionTime(LocalDate.now());
            user.setNotWorkDate(LocalDate.now());
            user.setBeginContract(LocalDate.now());
            user.setEndContract(LocalDate.now());
            user.setWorkAge("无限");
            user.setSalaryId(1);

            users.add(user);
        }
        System.out.println("create user");
        Connection conn = getConn();
        String sql = "insert into t_employee(name, gender, birthday, idCard, nationId, nativePlace, politicId, email, phone, address, departmentId, jobLevelId, posId, engageForm, tiptopDegree, specialty, school, beginDate, workState, workId, contractTerm, conversionTime, notWorkDate, beginContract, endContract, workAge, salaryId) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
        PreparedStatement pstm = conn.prepareStatement(sql);
        for (int i = 0; i < users.size(); i++) {
            Employee user = users.get(i);
            pstm.setString(1, user.getName());
            pstm.setString(2, user.getGender());
            pstm.setDate(3, Date.valueOf(user.getBirthday()));
            pstm.setString(4, user.getIdCard());
            pstm.setInt(5, user.getNationId());
            pstm.setString(6, user.getNativePlace());
            pstm.setInt(7, user.getPoliticId());
            pstm.setString(8, user.getEmail());
            pstm.setString(9, user.getPhone());
            pstm.setString(10, user.getAddress());
            pstm.setInt(11, user.getDepartmentId());
            pstm.setInt(12, user.getJobLevelId());
            pstm.setInt(13, user.getPosId());
            pstm.setString(14, user.getEngageForm());
            pstm.setString(15, user.getTiptopDegree());
            pstm.setString(16, user.getSpecialty());
            pstm.setString(17, user.getSchool());
            pstm.setDate(18, Date.valueOf(user.getBeginDate()));
            pstm.setString(19, user.getWorkState());
            pstm.setInt(20, user.getWorkId());
            pstm.setDouble(21, user.getContractTerm());
            pstm.setDate(22, Date.valueOf(user.getConversionTime()));
            pstm.setDate(23, Date.valueOf(user.getNotWorkDate()));
            pstm.setDate(24, Date.valueOf(user.getBeginContract()));
            pstm.setDate(25, Date.valueOf(user.getEndContract()));
            pstm.setString(26, user.getWorkAge());
            pstm.setInt(27, user.getSalaryId());

            pstm.addBatch();
        }
        pstm.executeBatch();
        pstm.clearParameters();
        conn.close();
        System.out.println("insert to db");
        //登录生成令牌
//        String loginUrl = "http://localhost:8080/login/doLogin";
//        File file = new File("C:\\Users\\w\\Desktop\\user.txt");
//        if (file.exists()) {
//            file.delete();
//        }
//        RandomAccessFile raf = new RandomAccessFile(file, "rw");
//        raf.seek(0);
//        for (int i = 0; i < users.size(); i++) {
//            User user = users.get(i);
//            URL url = new URL(loginUrl);
//            HttpURLConnection co = (HttpURLConnection) url.openConnection();
//            co.setRequestMethod("POST");
//            co.setDoOutput(true);
//            OutputStream out = co.getOutputStream();
//            String params = "mobile=" + user.getId() + "&password=" + MD5Util.inputPassToFromPass("123456");
//            out.write(params.getBytes());
//            out.flush();
//            InputStream inputStream = co.getInputStream();
//            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
//            byte buff[] = new byte[1024];
//            int len = 0;
//            while ((len = inputStream.read(buff)) >= 0) {
//                byteArrayOutputStream.write(buff, 0, len);
//            }
//            inputStream.close();
//            byteArrayOutputStream.close();
//            String response = new String(byteArrayOutputStream.toByteArray());
//            ObjectMapper mapper = new ObjectMapper();
//            RespBean respBean = mapper.readValue(response, RespBean.class);
//            String userTicket = (String) respBean.getObj();
//            System.out.println("create userTicket:" + userTicket);
//            String row = user.getId() + "," + userTicket;
//            raf.seek(raf.length());
//            raf.write(row.getBytes());
//            raf.write("\r\n".getBytes());
//            System.out.println("write to file:" + user.getId() + ":" + userTicket);
//        }
//        raf.close();
//        System.out.println("over");
    }

    private static Connection getConn() throws Exception {

        String url = "jdbc:mysql://localhost:3306/yeb?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai";
        String userName = "root";
        String password = "root";
        String driver = "com.mysql.cj.jdbc.Driver";
        Class.forName(driver);
        return DriverManager.getConnection(url, userName, password);
    }

    public static void main(String[] args) throws Exception {
        createUser(0);
    }

}
