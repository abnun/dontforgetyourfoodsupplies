package name.markus_mueller.controllers

import name.markus_mueller.domain.Entity
import name.markus_mueller.domain.Entity
import name.markus_mueller.domain.ArchiveSupply
import name.markus_mueller.domain.ArchiveSupply


class EntityController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list =
	{
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ entityInstanceList: Entity.list( params ), entityInstanceTotal: Entity.count() ]
    }

    def show =
	{
        def entityInstance = Entity.get( params.id )

        if(!entityInstance)
		{
            flash.message = "Entity not found with id ${params.id}"
            redirect(action:list)
        }
        else
		{
			return [ entityInstance : entityInstance ]
		}
    }

    def delete =
	{
        def entityInstance = Entity.get( params.id )
        if(entityInstance)
		{
            try
			{
                entityInstance.delete()
                flash.message = "Entity ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e)
			{
                flash.message = "Entity ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else
		{
            flash.message = "Entity not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit =
	{
        def entityInstance = Entity.get( params.id )

        if(!entityInstance)
		{
            flash.message = "Entity not found with id ${params.id}"
            redirect(action:list)
        }
        else
		{
            return [ entityInstance : entityInstance ]
        }
    }

    def update =
	{
        def entityInstance = Entity.get( params.id )
        if(entityInstance)
		{
            if(params.version)
			{
                def version = params.version.toLong()
                if(entityInstance.version > version)
				{
                    
                    entityInstance.errors.rejectValue("version", "entity.optimistic.locking.failure", "Another user has updated this Entity while you were editing.")
                    render(view:'edit',model:[entityInstance:entityInstance])
                    return
                }
            }
            entityInstance.properties = params
            if(!entityInstance.hasErrors() && entityInstance.save())
			{
                flash.message = "Entity ${params.id} updated"
                redirect(action:show,id:entityInstance.id)
            }
            else
			{
                render(view:'edit',model:[entityInstance:entityInstance])
            }
        }
        else
		{
            flash.message = "Entity not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create =
	{
        def entityInstance = new Entity()
        entityInstance.properties = params
        return ['entityInstance':entityInstance]
    }

    def save =
	{
        def entityInstance = new Entity(params)
        def archiveEntityInstance = new ArchiveSupply(params)

        if(!entityInstance.hasErrors() && entityInstance.save() && !archiveEntityInstance.hasErrors() && archiveEntityInstance.save())
		{
            flash.message = "Entity ${entityInstance.id} created"
            redirect(action:show,id:entityInstance.id)
        }
        else
		{
            render(view:'create',model:[entityInstance:entityInstance])
        }
    }
}
