package name.markus_mueller.dontforgetyourfoodsupplies

class FoodCategoryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        //params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [foodCategoryInstanceList: FoodCategory.list(params), foodCategoryInstanceTotal: FoodCategory.count()]
    }

    def create = {
        def foodCategoryInstance = new FoodCategory()
        foodCategoryInstance.properties = params
        return [foodCategoryInstance: foodCategoryInstance]
    }

    def save = {
        def foodCategoryInstance = new FoodCategory(params)
        if (foodCategoryInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'foodCategory.label', default: 'FoodCategory'), foodCategoryInstance.id])}"
            redirect(action: "show", id: foodCategoryInstance.id)
        }
        else {
            render(view: "create", model: [foodCategoryInstance: foodCategoryInstance])
        }
    }

    def show = {
        def foodCategoryInstance = FoodCategory.get(params.id)
        if (!foodCategoryInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'foodCategory.label', default: 'FoodCategory'), params.id])}"
            redirect(action: "list")
        }
        else {
            [foodCategoryInstance: foodCategoryInstance]
        }
    }

    def edit = {
        def foodCategoryInstance = FoodCategory.get(params.id)
        if (!foodCategoryInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'foodCategory.label', default: 'FoodCategory'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [foodCategoryInstance: foodCategoryInstance]
        }
    }

    def update = {
        def foodCategoryInstance = FoodCategory.get(params.id)
        if (foodCategoryInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (foodCategoryInstance.version > version) {
                    
                    foodCategoryInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'foodCategory.label', default: 'FoodCategory')], "Another user has updated this FoodCategory while you were editing")
                    render(view: "edit", model: [foodCategoryInstance: foodCategoryInstance])
                    return
                }
            }
            foodCategoryInstance.properties = params
            if (!foodCategoryInstance.hasErrors() && foodCategoryInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'foodCategory.label', default: 'FoodCategory'), foodCategoryInstance.id])}"
                redirect(action: "show", id: foodCategoryInstance.id)
            }
            else {
                render(view: "edit", model: [foodCategoryInstance: foodCategoryInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'foodCategory.label', default: 'FoodCategory'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def foodCategoryInstance = FoodCategory.get(params.id)
        if (foodCategoryInstance) {
            try {
                foodCategoryInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'foodCategory.label', default: 'FoodCategory'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'foodCategory.label', default: 'FoodCategory'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'foodCategory.label', default: 'FoodCategory'), params.id])}"
            redirect(action: "list")
        }
    }
}
