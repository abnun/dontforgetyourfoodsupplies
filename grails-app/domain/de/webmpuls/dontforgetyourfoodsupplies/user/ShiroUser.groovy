package de.webmpuls.dontforgetyourfoodsupplies.user
class ShiroUser {
    String username
	String firstname
	String name
    String passwordHash
    
    static hasMany = [ roles: ShiroRole, permissions: String ]

    static constraints = {
        username(nullable: false, blank: false)
    }

	public String toString()
	{
		return "$firstname $name"
	}
}
