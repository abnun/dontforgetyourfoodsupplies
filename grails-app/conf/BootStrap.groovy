import de.webmpuls.dontforgetyourfoodsupplies.user.ShiroUser
import org.apache.shiro.crypto.hash.Sha1Hash
import de.webmpuls.dontforgetyourfoodsupplies.Setting

class BootStrap
{

     def init =
	 {
		 servletContext ->

		 Collection userList = ShiroUser.list()
		 if(userList.isEmpty())
		 {
			 ShiroUser user = new ShiroUser(firstname: 'Markus', name: 'Müller', username: "markus", passwordHash: new Sha1Hash("kermit").toHex())
			 user.addToPermissions("*:*")
			 if(user.save(flush: true))
			 {
				 Setting setting = new Setting(user: user)
				 if(!setting.save(flush: true))
				 {
					 setting.errors.allErrors.each
					 {
						 println it
					 }
				 }
			 }
			 else
			 {
				 user.errors.allErrors.each
				 {
					 println it
				 }
			 }
		 }
	 }
     def destroy =
	 {
     }
} 