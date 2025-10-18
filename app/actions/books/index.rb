# frozen_string_literal: true

module Bookshelf
  module Actions
    module Books
      class Index < Bookshelf::Action
        def handle(request, response)
			page = (request.params[:page] || 1).to_i
			per_page = (request.params[:per_page] || 5).to_i
			
			response.render(
				view,
				page: page,
				per_page: per_page
			)
        end
      end
    end
  end
end
