package name.markus_mueller.controllers

import name.markus_mueller.domain.FoodCategory

class FoodCategoryController
{

	def index = { redirect(action: list, params: params) }

	// the delete, save and update actions only accept POST requests
	static allowedMethods = [delete: 'POST', save: 'POST', update: 'POST']

	def list = {
		//params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
		[foodCategoryInstanceList: FoodCategory.list(params), foodCategoryInstanceTotal: FoodCategory.count()]
	}

	def show = {
		def foodCategoryInstance = FoodCategory.get(params.id)

		if (!foodCategoryInstance)
		{
			flash.message = "FoodCategory not found with id ${params.id}"
			redirect(action: list)
		}
		else
		{ return [foodCategoryInstance: foodCategoryInstance] }
	}

	def delete = {
		def foodCategoryInstance = FoodCategory.get(params.id)
		if (foodCategoryInstance)
		{
			try
			{
				foodCategoryInstance.delete()
				flash.message = "FoodCategory ${params.id} deleted"
				redirect(action: list)
			}
			catch (org.springframework.dao.DataIntegrityViolationException e)
			{
				flash.message = "FoodCategory ${params.id} could not be deleted"
				redirect(action: show, id: params.id)
			}
		}
		else
		{
			flash.message = "FoodCategory not found with id ${params.id}"
			redirect(action: list)
		}
	}

	def edit = {
		def foodCategoryInstance = FoodCategory.get(params.id)

		if (!foodCategoryInstance)
		{
			flash.message = "FoodCategory not found with id ${params.id}"
			redirect(action: list)
		}
		else
		{
			return [foodCategoryInstance: foodCategoryInstance]
		}
	}

	def update = {
		def foodCategoryInstance = FoodCategory.get(params.id)
		if (foodCategoryInstance)
		{
			if (params.version)
			{
				def version = params.version.toLong()
				if (foodCategoryInstance.version > version)
				{

					foodCategoryInstance.errors.rejectValue("version", "foodCategory.optimistic.locking.failure", "Another user has updated this FoodCategory while you were editing.")
					render(view: 'edit', model: [foodCategoryInstance: foodCategoryInstance])
					return
				}
			}
			foodCategoryInstance.properties = params
			if (!foodCategoryInstance.hasErrors() && foodCategoryInstance.save())
			{
				flash.message = "FoodCategory ${params.id} updated"
				redirect(action: show, id: foodCategoryInstance.id)
			}
			else
			{
				render(view: 'edit', model: [foodCategoryInstance: foodCategoryInstance])
			}
		}
		else
		{
			flash.message = "FoodCategory not found with id ${params.id}"
			redirect(action: edit, id: params.id)
		}
	}

	def create = {
		def foodCategoryInstance = new FoodCategory()
		foodCategoryInstance.properties = params
		return ['foodCategoryInstance': foodCategoryInstance]
	}

	def save = {
		def foodCategoryInstance = new FoodCategory(params)
		if (!foodCategoryInstance.hasErrors() && foodCategoryInstance.save())
		{
			flash.message = "FoodCategory ${foodCategoryInstance.id} created"
			redirect(action: show, id: foodCategoryInstance.id)
		}
		else
		{
			render(view: 'create', model: [foodCategoryInstance: foodCategoryInstance])
		}
	}
}
