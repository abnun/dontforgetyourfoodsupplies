package name.markus_mueller.dontforgetyourfoodsupplies

class FixFuerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        //params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [fixFuerInstanceList: FixFuer.list(params), fixFuerInstanceTotal: FixFuer.count()]
    }

    def create = {
        def fixFuerInstance = new FixFuer()
        fixFuerInstance.properties = params
        return [fixFuerInstance: fixFuerInstance]
    }

    def save = {
        def fixFuerInstance = new FixFuer(params)
		def archiveSupplyInstance = new ArchiveSupply(params)
        if (fixFuerInstance.save(flush: true) && archiveSupplyInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'fixFuer.label', default: 'FixFuer'), fixFuerInstance.id])}"
            redirect(action: "show", id: fixFuerInstance.id)
        }
        else {
            render(view: "create", model: [fixFuerInstance: fixFuerInstance])
        }
    }

    def show = {
        def fixFuerInstance = FixFuer.get(params.id)
        if (!fixFuerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'fixFuer.label', default: 'FixFuer'), params.id])}"
            redirect(action: "list")
        }
        else {
            [fixFuerInstance: fixFuerInstance]
        }
    }

    def edit = {
        def fixFuerInstance = FixFuer.get(params.id)
        if (!fixFuerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'fixFuer.label', default: 'FixFuer'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [fixFuerInstance: fixFuerInstance]
        }
    }

    def update = {
        def fixFuerInstance = FixFuer.get(params.id)
        if (fixFuerInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (fixFuerInstance.version > version) {
                    
                    fixFuerInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'fixFuer.label', default: 'FixFuer')], "Another user has updated this FixFuer while you were editing")
                    render(view: "edit", model: [fixFuerInstance: fixFuerInstance])
                    return
                }
            }
            fixFuerInstance.properties = params
            if (!fixFuerInstance.hasErrors() && fixFuerInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'fixFuer.label', default: 'FixFuer'), fixFuerInstance.id])}"
                redirect(action: "show", id: fixFuerInstance.id)
            }
            else {
                render(view: "edit", model: [fixFuerInstance: fixFuerInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'fixFuer.label', default: 'FixFuer'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def fixFuerInstance = FixFuer.get(params.id)
        if (fixFuerInstance) {
            try {
                fixFuerInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'fixFuer.label', default: 'FixFuer'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'fixFuer.label', default: 'FixFuer'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'fixFuer.label', default: 'FixFuer'), params.id])}"
            redirect(action: "list")
        }
    }
}
