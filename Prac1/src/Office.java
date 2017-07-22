class Office extends Venue {
	protected String firstName;
	protected String surname;
	protected String phoneNumber;

	public Office(String _builiding, String _room, String _name, String _surname, String _phoneNumber) {
		super(_builiding, _room);
		firstName = _name;
		surname = _surname;
		phoneNumber = _phoneNumber;
	}

	public void updateValues(String _name, String _surname, String _phoneNumber) {
		firstName = _name;
		surname = _surname;
		phoneNumber = _phoneNumber;
	}

	public String toString() {
		return super.toString() + "\n\tBelongs to " + firstName + " " + surname + "\n\tContact Number is " + phoneNumber;
	}

	public static void main(String[] args) {
		Office mine = new Office("IT", "4-15", "Keegan", "Ferrett", "(079) 622 6583");
		System.out.println(mine);
	}
}