module Apress
  module AmazonAssets
    module Api
      module V1
        class AssetsController < ::Apress::Api::ApiController::Base
          def show
            @asset ||= Apress::AmazonAssets::PublicAsset.find(params[:id])
          end
        end
      end
    end
  end
end
