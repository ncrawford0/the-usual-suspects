class ReviewMailer < ApplicationMailer
  def new_review(review, bar)
    @review = review
    @bar = bar

    mail(from: "system@bevboston.com",
         to: "#{@bar.user.email}",
         subject: "#{@review.user.email} has added a comment to your #{@bar.name} page on bevboston.",
        )
  end
end
