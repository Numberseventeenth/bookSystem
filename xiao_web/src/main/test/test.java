import com.xiao.utils.DateUtils;

import java.util.Date;
import java.util.Random;

public class test {

    public static void main(String[] args) {
        Random random = new Random();
        String newName = String.valueOf(random.nextInt(64));
        System.out.println(newName);
        String date = DateUtils.date2String(new Date(),"yyyy-MM-dd");
        System.out.println(date);
        String fileName = newName + date;
        System.out.println(fileName);
    }
}
