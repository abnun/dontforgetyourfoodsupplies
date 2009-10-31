package de.webmpuls.dontforgetyourfoodsupplies

class SuessieController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        //params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [suessieInstanceList: Suessie.list(params), suessieInstanceTotal: Suessie.count()]
    }

    def create = {
        def suessieInstance = new Suessie()
        suessieInstance.properties = params
        return [suessieInstance: suessieInstance]
    }

    def save = {
        def suessieInstance = new Suessie(params)
		def archiveSupplyInstance = new ArchiveSupply(params)
        if (suessieInstance.save(flush: true) && archiveSupplyInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'suessie.label', default: 'Suessie'), suessieInstance.id])}"
            redirect(action: "show", id: suessieInstance.id)
        }
        else {
            render(view: "create", model: [suessieInstance: suessieInstance])
        }
    }

    def show = {
        def suessieInstance = Suessie.get(params.id)
        if (!suessieInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'suessie.label', default: 'Suessie'), params.id])}"
            redirect(action: "list")
        }
        else {
            [suessieInstance: suessieInstance]
        }
    }

    def edit = {
        def suessieInstance = Suessie.get(params.id)
        if (!suessieInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'suessie.label', default: 'Suessie'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [suessieInstance: suessieInstance]
        }
    }

    def update = {
        def suessieInstance = Suessie.get(params.id)
        if (suessieInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (suessieInstance.version > version) {
                    
                    suessieInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'suessie.label', default: 'Suessie')], "Another user has updated this Suessie while you were editing")
                    render(view: "edit", model: [suessieInstance: suessieInstance])
                    return
                }
            }
            suessieInstance.properties = params
            if (!suessieInstance.hasErrors() && suessieInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'suessie.label', default: 'Suessie'), suessieInstance.id])}"
                redirect(action: "show", id: suessieInstance.id)
            }
            else {
                render(view: "edit", model: [suessieInstance: suessieInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'suessie.label', default: 'Suessie'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def suessieInstance = Suessie.get(params.id)
        if (suessieInstance) {
            try {
                suessieInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'suessie.label', default: 'Suessie'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'suessie.label', default: 'Suessie'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'suessie.label', default: 'Suessie'), params.id])}"
            redirect(action: "list")
        }
    }
}
