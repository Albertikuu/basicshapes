class CommitsController < ApplicationController
	require 'slack-ruby-client'

	skip_before_action :verify_authenticity_token, only: :create
	before_action :slack_config

	def index
   		commits = []
   		current_user.teams.each do |t|
   			commits << t.commits
   		end
		render json: commits
	end

	def new
	end

	def create
		@commit = Commit.create!(commit_params)
		pretext= "#{current_user.full_name} has made a new commit in the category #{@commit.page.category.title.capitalize}"
		title = "#{@commit.title}"
		title_link = "https://basicshapes.herokuapp.com/bs/#{@commit.page.category.slug}/#{@commit.page.slug}"
		footer = "with love by Basicshapes"
        footer_icon = "https://avatars.slack-edge.com/2017-03-14/154308508964_76b45d8ff0cb5f68a8dd_72.jpg"
        # TODO add user icon: path & current_user.avatar_file_name
		@client.chat_postMessage(channel: '#general', as_user: true, attachments: [{
			pretext: pretext, 
			title: title, 
			title_link: title_link,
			footer: footer,
			footer_icon: footer_icon
			}])
		redirect_to('/')
	end


	private

	def commit_params
		params.permit(:title, :message, :image, :user_id, :version_id, :page_id)
	end

	def slack_config
		Slack.configure do |config|
		  config.token = ENV['SLACK_API_TOKEN']
		  fail 'Missing ENV[SLACK_API_TOKEN]!' unless config.token
		end
		@client = Slack::Web::Client.new
	end
end
