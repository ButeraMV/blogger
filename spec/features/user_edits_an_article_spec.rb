require 'rails_helper'

describe 'user edits an article' do
    describe 'they link from the articles index' do
        describe 'they fill in a title and body' do
            it 'creates a new article' do
                article = Article.create!(title: 'Old Title', body: 'Old Body')

                visit article_path(article)
                click_link 'Edit'

                expect(current_path).to eq(edit_article_path(article))

                fill_in 'article[title]', with: 'New Title!'
                fill_in 'article[body]', with: 'New Body!'
                click_on 'Update Article'

                expect(page).to have_content('New Title!')
                expect(page).to have_content('New Body!')
                expect(page).to have_content("Article 'New Title!' Updated!")
            end
        end
    end
end