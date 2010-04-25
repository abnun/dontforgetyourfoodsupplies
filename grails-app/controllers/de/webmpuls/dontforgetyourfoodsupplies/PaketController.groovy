package de.webmpuls.dontforgetyourfoodsupplies

import grails.converters.deep.XML
import grails.converters.deep.JSON

class PaketController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        //params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)

		def paketList = Paket.list()

		withFormat
		{

			xml
			{
				render(text: paketList as XML, contentType: 'text/xml')
			}

			json
			{
				render(text: paketList as JSON, contentType: 'text/json')
			}

			html
			{
				[paketInstanceList: paketList, paketInstanceTotal: Paket.count()]
			}
		}
    }

    def create = {
        def paketInstance = new Paket()
        paketInstance.properties = params
        return [paketInstance: paketInstance]
    }

    def save = {
        def paketInstance = new Paket(params)
		def archiveSupplyInstance = new ArchiveSupply(name: params.name, supplyClass: Paket.newInstance().getClass().getSimpleName())
        if (paketInstance.save(flush: true) && archiveSupplyInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'paket.label', default: 'Paket'), paketInstance.id])}"
            redirect(action: "show", id: paketInstance.id)
        }
        else {
            render(view: "create", model: [paketInstance: paketInstance])
        }
    }

    def show = {
        def paketInstance = Paket.get(params.id)
        if (!paketInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paket.label', default: 'Paket'), params.id])}"
            redirect(action: "list")
        }
        else {
            [paketInstance: paketInstance]
        }
    }

    def edit = {
        def paketInstance = Paket.get(params.id)
        if (!paketInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paket.label', default: 'Paket'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [paketInstance: paketInstance]
        }
    }

    def update = {
        def paketInstance = Paket.get(params.id)
        if (paketInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (paketInstance.version > version) {
                    
                    paketInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'paket.label', default: 'Paket')], "Another user has updated this Paket while you were editing")
                    render(view: "edit", model: [paketInstance: paketInstance])
                    return
                }
            }
            paketInstance.properties = params
            if (!paketInstance.hasErrors() && paketInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'paket.label', default: 'Paket'), paketInstance.id])}"
                redirect(action: "show", id: paketInstance.id)
            }
            else {
                render(view: "edit", model: [paketInstance: paketInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paket.label', default: 'Paket'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def paketInstance = Paket.get(params.id)
        if (paketInstance) {
            try {
                paketInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'paket.label', default: 'Paket'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'paket.label', default: 'Paket'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paket.label', default: 'Paket'), params.id])}"
            redirect(action: "list")
        }
    }
}
