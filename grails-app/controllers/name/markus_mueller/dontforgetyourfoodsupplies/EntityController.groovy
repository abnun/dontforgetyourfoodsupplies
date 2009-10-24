package name.markus_mueller.dontforgetyourfoodsupplies

class EntityController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        //params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [entityInstanceList: Entity.list(params), entityInstanceTotal: Entity.count()]
    }

    def create = {
        def entityInstance = new Entity()
        entityInstance.properties = params
        return [entityInstance: entityInstance]
    }

    def save = {
        def entityInstance = new Entity(params)
        if (entityInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'entity.label', default: 'Entity'), entityInstance.id])}"
            redirect(action: "show", id: entityInstance.id)
        }
        else {
            render(view: "create", model: [entityInstance: entityInstance])
        }
    }

    def show = {
        def entityInstance = Entity.get(params.id)
        if (!entityInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'entity.label', default: 'Entity'), params.id])}"
            redirect(action: "list")
        }
        else {
            [entityInstance: entityInstance]
        }
    }

    def edit = {
        def entityInstance = Entity.get(params.id)
        if (!entityInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'entity.label', default: 'Entity'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [entityInstance: entityInstance]
        }
    }

    def update = {
        def entityInstance = Entity.get(params.id)
        if (entityInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (entityInstance.version > version) {
                    
                    entityInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'entity.label', default: 'Entity')], "Another user has updated this Entity while you were editing")
                    render(view: "edit", model: [entityInstance: entityInstance])
                    return
                }
            }
            entityInstance.properties = params
            if (!entityInstance.hasErrors() && entityInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'entity.label', default: 'Entity'), entityInstance.id])}"
                redirect(action: "show", id: entityInstance.id)
            }
            else {
                render(view: "edit", model: [entityInstance: entityInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'entity.label', default: 'Entity'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def entityInstance = Entity.get(params.id)
        if (entityInstance) {
            try {
                entityInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'entity.label', default: 'Entity'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'entity.label', default: 'Entity'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'entity.label', default: 'Entity'), params.id])}"
            redirect(action: "list")
        }
    }
}
