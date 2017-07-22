import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Tester
{
    public static void main(String[] args)
    {
        db = new Database();
		db.open();
		mainmenu();
        try
        {
            BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
            String input = reader.readLine();
            while(!input.equals("8"))
            {
                if(input.equals("1"))
                    db.addBuilding(reader);
                if(input.equals("2"))
                    db.addLectureHall(reader);
                if(input.equals("3"))
                    db.addOffice(reader);
                if(input.equals("4"))
                    db.listVenues();
                if(input.equals("5"))
                    db.findOffice(reader);
                if(input.equals("6"))
                    db.findLectureHall(reader);
                if(input.equals("7"))
                    db.updateVenue(reader);
                mainmenu();
                input = reader.readLine();
            }
        }
        catch(IOException e)
        {
            System.out.println("Error: " + e);
        }
		db.close();
    }
    
    public static void mainmenu()
	{
            System.out.println("MAIN MENU");
            System.out.println("=========");
            System.out.println("1.	Add building");
            System.out.println("2.	Add lecture hall");
            System.out.println("3.	Add office");
            System.out.println("4.	List venues");
            System.out.println("5.	Find office(QBE)");
            System.out.println("6.	Find lecture hall(SODA)");
            System.out.println("7.	Update venue");
            System.out.println("8.	Exit");
	}
    public static Database db;
}