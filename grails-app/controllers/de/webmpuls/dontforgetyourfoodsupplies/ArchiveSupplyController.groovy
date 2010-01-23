package de.webmpuls.dontforgetyourfoodsupplies

class ArchiveSupplyController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        //params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [archiveSupplyInstanceList: ArchiveSupply.list(params), archiveSupplyInstanceTotal: ArchiveSupply.count()]
    }

    def create = {
        def archiveSupplyInstance = new ArchiveSupply()
        archiveSupplyInstance.properties = params
        return [archiveSupplyInstance: archiveSupplyInstance]
    }

    def save = {
        def archiveSupplyInstance = new ArchiveSupply(params)
        if (archiveSupplyInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'archiveSupply.label', default: 'ArchiveSupply'), archiveSupplyInstance.id])}"
            redirect(action: "show", id: archiveSupplyInstance.id)
        }
        else {
            render(view: "create", model: [archiveSupplyInstance: archiveSupplyInstance])
        }
    }

    def show = {
        def archiveSupplyInstance = ArchiveSupply.get(params.id)
        if (!archiveSupplyInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'archiveSupply.label', default: 'ArchiveSupply'), params.id])}"
            redirect(action: "list")
        }
        else {
            [archiveSupplyInstance: archiveSupplyInstance]
        }
    }

    def edit = {
        def archiveSupplyInstance = ArchiveSupply.get(params.id)
        if (!archiveSupplyInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'archiveSupply.label', default: 'ArchiveSupply'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [archiveSupplyInstance: archiveSupplyInstance]
        }
    }

    def update = {
        def archiveSupplyInstance = ArchiveSupply.get(params.id)
        if (archiveSupplyInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (archiveSupplyInstance.version > version) {
                    
                    archiveSupplyInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'archiveSupply.label', default: 'ArchiveSupply')] as Object[], "Another user has updated this ArchiveSupply while you were editing")
                    render(view: "edit", model: [archiveSupplyInstance: archiveSupplyInstance])
                    return
                }
            }
            archiveSupplyInstance.properties = params
            if (!archiveSupplyInstance.hasErrors() && archiveSupplyInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'archiveSupply.label', default: 'ArchiveSupply'), archiveSupplyInstance.id])}"
                redirect(action: "show", id: archiveSupplyInstance.id)
            }
            else {
                render(view: "edit", model: [archiveSupplyInstance: archiveSupplyInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'archiveSupply.label', default: 'ArchiveSupply'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def archiveSupplyInstance = ArchiveSupply.get(params.id)
        if (archiveSupplyInstance) {
            try {
                archiveSupplyInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'archiveSupply.label', default: 'ArchiveSupply'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'archiveSupply.label', default: 'ArchiveSupply'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'archiveSupply.label', default: 'ArchiveSupply'), params.id])}"
            redirect(action: "list")
        }
    }
}
