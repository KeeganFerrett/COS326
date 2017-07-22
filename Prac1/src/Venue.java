class Venue {
	protected Building building;
	protected String roomNumber;

	public Venue(String _building, String _roomNumber) {
		building = new Building(_building);
		roomNumber = _roomNumber;
	}

	public String toString() {
		return building +"\n\tRoom Number " + roomNumber;
	}

	public static void main(String[] args) {
		Venue venue = new Venue("IT", "4-2");
		System.out.println(venue);
	}
}