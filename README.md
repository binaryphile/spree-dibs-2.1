DidItBetter.com Software Store 2.1
==================================

This is an instance of the [Spree] ecommerce framework written in [Ruby
on Rails].  You can see the latest version of it running at
<http://store.diditbetter.com/>.

You can read a [post I wrote] on how to get it working under [Vagrant].
You will at least need to make a copy of `database.yml` to get this
store running.  You should really read the post for all of the details.

It is a fairly vanilla implementation with a few important extensions
and customizations.  The theme is stock with minor tweaks.

The big changes include:

- [Added html email notifications]
- [Customized emails with order info]
- [Theme changes] including the logo and adding an Authorize.net seal to
  checkout
- [Print invoice] extension for making PDFs of orders
- [Flexi-variants] extension for adding product options without making
  whole new products
- [DIBS referral] extension (our own) for crediting agents when they
  send links to customers
- [Email to friend] extension

A note about the Authorize.net seal: it won't work for your site as is
because it has our customer id encoded in it, which Authorize.net will
only recognize from our domain.  You'll need to customize it with your
own id.

If you're just learning about how to work with Spree, the [commit
history] on this project is a fine place to look, especially at the
beginning of the history.  The starting commits are well-groomed because
with every minor release I create a new repository and regroom all of
the commits from the last release into a small set of focused commits.
The commits which come after those ones then devolve into the normal
everyday maintenance, so they are a little more opaque, but they can
still be useful to examine.

[Spree]: http://spreecommerce.com/
[Ruby on Rails]: http://rubyonrails.org/
[Vagrant]: http://www.vagrantup.com/
[post I wrote]: http://www.binaryphile.com/spree/cloning-my-spree-instance-and-getting-it-running-under-vagrant/
[Added html email notifications]: https://github.com/binaryphile/spree_dibs_1.3/commit/a372a8772a4a4a5aa3cd8f64e1bc321a723d247e
[Customized emails with order info]: https://github.com/binaryphile/spree_dibs_1.3/commit/9764a87e11d2a80511b73a9146111e8789d58f51
[Theme changes]: https://github.com/binaryphile/spree_dibs_1.3/commit/aa8d33493f81a5b5016923beb689cdb6823df748
[Print invoice]: https://github.com/spree/spree_print_invoice
[Flexi-variants]: https://github.com/jsqu99/spree_flexi_variants
[DIBS referral]: https://github.com/binaryphile/spree_dibs_referral
[Email to friend]: https://github.com/spree/spree_email_to_friend
[commit history]: https://github.com/binaryphile/spree-dibs-2.1/commits/master

