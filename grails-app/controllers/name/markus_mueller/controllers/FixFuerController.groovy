

package name.markus_mueller.controllers

import name.markus_mueller.domain.FixFuer
import name.markus_mueller.domain.ArchiveSupply

class FixFuerController
{

    def index =
	{
		redirect(action:list,params:params)
	}

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list =
	{
        //params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ fixFuerInstanceList: FixFuer.list( params ), fixFuerInstanceTotal: FixFuer.count() ]
    }

    def show =
	{
        def fixFuerInstance = FixFuer.get( params.id )

        if(!fixFuerInstance)
		{
            flash.message = "FixFuer not found with id ${params.id}"
            redirect(action:list)
        }
        else
		{
			return [ fixFuerInstance : fixFuerInstance ]
		}
    }

    def delete =
	{
        def fixFuerInstance = FixFuer.get( params.id )
        if(fixFuerInstance)
		{
            try
			{
                fixFuerInstance.delete(flush:true)
                flash.message = "FixFuer ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e)
			{
                flash.message = "FixFuer ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else
		{
            flash.message = "FixFuer not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit =
	{
        def fixFuerInstance = FixFuer.get( params.id )

        if(!fixFuerInstance)
		{
            flash.message = "FixFuer not found with id ${params.id}"
            redirect(action:list)
        }
        else
		{
            return [ fixFuerInstance : fixFuerInstance ]
        }
    }

    def update =
	{
        def fixFuerInstance = FixFuer.get( params.id )
        if(fixFuerInstance)
		{
            if(params.version)
			{
                def version = params.version.toLong()
                if(fixFuerInstance.version > version)
				{

                    fixFuerInstance.errors.rejectValue("version", "fixFuer.optimistic.locking.failure", "Another user has updated this FixFuer while you were editing.")
                    render(view:'edit',model:[fixFuerInstance:fixFuerInstance])
                    return
                }
            }
            fixFuerInstance.properties = params
            if(!fixFuerInstance.hasErrors() && fixFuerInstance.save())
			{
                flash.message = "FixFuer ${params.id} updated"
                redirect(action:show,id:fixFuerInstance.id)
            }
            else
			{
                render(view:'edit',model:[fixFuerInstance:fixFuerInstance])
            }
        }
        else {
            flash.message = "FixFuer not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create =
	{
        def fixFuerInstance = new FixFuer()
        fixFuerInstance.properties = params
        return ['fixFuerInstance':fixFuerInstance]
    }

    def save =
	{
        def fixFuerInstance = new FixFuer(params)
		def archiveEntityInstance = new ArchiveSupply(params)

        if(!fixFuerInstance.hasErrors() && fixFuerInstance.save() && !archiveEntityInstance.hasErrors() && archiveEntityInstance.save())
		{
            flash.message = "FixFuer ${fixFuerInstance.id} created"
            redirect(action:show,id:fixFuerInstance.id)
        }
        else
		{
            render(view:'create',model:[fixFuerInstance:fixFuerInstance])
        }
    }
}
