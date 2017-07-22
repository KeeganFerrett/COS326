class Building {
	public String buildingName;

	public Building(String _name) {
		buildingName = _name;
	}

	public String toString() {
		return "\tBuilding " + buildingName;
	}

	public static void main(String[] args) {
		Building newBuilding = new Building("Thuto");
		System.out.println(newBuilding);
	}
}