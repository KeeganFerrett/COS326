class LectureHall extends Venue {
	protected int numberOfSeats;

	public LectureHall(String _building, String _room, int _seats) {
		super(_building, _room);
		numberOfSeats = _seats;
	}

	public void updateValues(int _seats) {
		numberOfSeats = _seats;
	}

	public String toString() {
		return super.toString() + "\n\t" + numberOfSeats + " Seats";
	}

	public static void main(String[] args) {
		LectureHall hall = new LectureHall("IT", "4-2", 200);
		System.out.println(hall);
	}
}