package name.markus_mueller.controllers

import org.compass.core.engine.SearchEngineQueryParseException
import name.markus_mueller.domain.Supply

class SearchController
{
	def searchableService
	
    /**
     * Index page with search form and results
     */
    def index =
	{
        if (!params.q?.trim())
		{
            return [:]
        }
        try
		{
			
//			def searchResult = searchableService.search(params.q, params)
			def searchResult = Supply.search("*" + params.q + "*")
            return [searchResult: searchResult, searchTerm: params.q.encodeAsHTML()]
        }
		catch (SearchEngineQueryParseException ex)
		{
            return [parseException: true]
        }
    }
}
