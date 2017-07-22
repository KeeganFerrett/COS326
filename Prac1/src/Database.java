import com.db4o.*;
//import com.db4o.ObjectContainer;
//import com.db4o.ObjectSet;
import com.db4o.query.Predicate;
import com.db4o.query.Query;
import com.db4o.query.Constraint;
import java.io.IOException;
import java.io.BufferedReader;
import java.util.List;
import java.util.ArrayList;

public class Database
{
    public void open() {
		database = Db4oEmbedded.openFile(Db4oEmbedded.newConfiguration(), FILENAME);
	}

	public void close() {
		database.close();
	}

    public void addBuilding(BufferedReader reader) throws IOException {
        System.out.print("\tInput a buidling name:\n\t");
        String buildingName = reader.readLine();
        Building newBuilding = new Building(buildingName);
        database.store(newBuilding);
        System.out.println("\tBuilding stored.");
    }

    public void addLectureHall(BufferedReader reader) throws IOException {
        System.out.print("\tInput a buidling name:\n\t");
        String building = reader.readLine();

        System.out.print("\tInput a room:\n\t");
        String room = reader.readLine();

        System.out.print("\tInput number of seats:\n\t");
        int seats = Integer.parseInt(reader.readLine());

        LectureHall newHall = new LectureHall(building, room, seats);
        database.store(newHall);

        System.out.println("\tLecture Hall stored.");
    }

    public void addOffice(BufferedReader reader) throws IOException { 
        System.out.print("\tInput a buidling name:\n\t");
        String building = reader.readLine();

        System.out.print("\tInput a room:\n\t");
        String room = reader.readLine();

        System.out.print("\tInput first name:\n\t");
        String firstName = reader.readLine();

        System.out.print("\tInput surname:\n\t");
        String surname = reader.readLine();

        System.out.print("\tInput contact number:\n\t");
        String number = reader.readLine();

        Office newOffice = new Office(building, room, firstName, surname, number);
        database.store(newOffice);
        System.out.println("\tOffice stored.");
    }

    public void listVenues() {
        ObjectSet result = database.queryByExample(Venue.class);
        output(result);
    }

    public void output(List set) {
        if (set.size() == 0) {
            System.out.println("\tNo results found.");
        }

        for (Object o : set) {
            System.out.println(o);
            System.out.println();
        }
    }

    public void findOffice(BufferedReader reader) throws IOException {
        System.out.print("\tInput a buidling name:\n\t");
        String building = reader.readLine();

        System.out.print("\tInput a room:\n\t");
        String room = reader.readLine();

        Office proto = new Office(building, room, null, null, null);
        ObjectSet result = database.queryByExample(proto);
        output(result);
    }

    public void findLectureHall(BufferedReader reader) throws IOException {
        System.out.print("\tInput a buidling name:\n\t");
        String building = reader.readLine();

        System.out.print("\tInput a room:\n\t");
        String room = reader.readLine();

        Query query = database.query();
        query.constrain(LectureHall.class);
        Constraint cons = query.descend("building").constrain(new Building(building));
        query.descend("roomNumber").constrain(room).and(cons);
        ObjectSet result = query.execute();
        output(result);
    }

    public void updateVenue(BufferedReader reader) throws IOException {
        System.out.print("\tInput a buidling name:\n\t");
        String building = reader.readLine();

        System.out.print("\tInput a room:\n\t");
        String room = reader.readLine();

        Query query = database.query();
        query.constrain(Venue.class);
        Constraint cons = query.descend("building").constrain(new Building(building));
        query.descend("roomNumber").constrain(room).and(cons);
        ObjectSet result = query.execute();

        if (result.size() == 0) {
            System.out.println("\tNo venue found matching the building and room.");
        }

        Object o = result.next();

        if (o.getClass() == LectureHall.class) {
            LectureHall updateHall = (LectureHall) o;

            System.out.print("\tInput number of seats:\n\t");
            int seats = Integer.parseInt(reader.readLine());

            updateHall.updateValues(seats);
            database.store(updateHall);
        } else if (o.getClass() == Office.class) {
            Office updateOffice = (Office) o;

            System.out.print("\tInput first name:\n\t");
            String firstName = reader.readLine();

            System.out.print("\tInput surname:\n\t");
            String surname = reader.readLine();

            System.out.print("\tInput contact number:\n\t");
            String number = reader.readLine();

            updateOffice.updateValues(firstName, surname, number);
            database.store(updateOffice);
        }
    }

	private ObjectContainer database;
	private final String FILENAME = "./assets/database.db";
    private final String NOT_IMPLEMENTED = "\033[01;31mNot Implemented\033[00m";
    private final String TESTING = "\033[01;31mCurrently Testing\033[00m";
}