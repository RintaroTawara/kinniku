namespace :applying_new_page do
  desc "人気記事更新"

  task run: :environment do
    ApplyingNewPage.run
  end
end