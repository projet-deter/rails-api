
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'admin', email: 'admin@admin.com', password: '654321qwerty')
User.create(name: 'admin2', email: 'admin2@admin.com', password: '654321qwerty')
User.create(name: 'admin3', email: 'admin3@admin.com', password: '654321qwerty')


Category.create(name: 'Arts and Entertainment')
Category.create(name: 'Cars & Other Vehicles')
Category.create(name: 'Computers and Electronics')
Category.create(name: 'Education and Communications')
Category.create(name: 'Family Life')
Category.create(name: 'Finance and Business')
Category.create(name: 'Food and Entertaining')
Category.create(name: 'Health')
Category.create(name: 'Hobbies and Crafts')
Category.create(name: 'Holidays and Traditions')
Category.create(name: 'Home and Garden')
Category.create(name: 'Personal Care and Style')
Category.create(name: 'Pets and Animals')
Category.create(name: 'Philosophy and Religion')
Category.create(name: 'Relationships')
Category.create(name: 'Sports and Fitness')
Category.create(name: 'Travel')
Category.create(name: 'Work World')
Category.create(name: 'Youth')


Article.create(
  title: 'Travel on Airplanes With a Machin Gun',
  description: 'If you enjoy shooting in places far from your home, you will probably need to carry a gun (and ammunition) on an airplane to get to
        your destination. While most "gun destinations" cater to high power rifles and shotguns, many "destinations" are for target-shooting
        matches where the guns are more-typically .22 rifle and pistol and air rifle and pistols.', body: '', category_id: 18, user_id: 1)

        Article.create(
          title: 'Celebrate Bastille Day',
          description: 'Bastille Day, or la Fête nationale (French National Day), is celebrated every year on July 14 to commemorate the Storming of the Bastille, a turning point in the French Revolution in 1789. Bastille Day celebrations were held the very next year, and about a century later, it became a national holiday celebrated with huge fireworks displays and a military parade down the streets of Paris. No matter how far you are from France this July 14, you can still hold your own le quatorze juillet celebration to recognize this historical day.', body: '', category_id: 10, user_id: 1)

                Article.create(
                  title: 'Build a Yurt',
                  description: 'Yurts are round, tent-like structures traditionally used in Mongolia as mobile homes. While yurts are not complex structures, they do require some general carpentry skills to build and set up. If you are a beginner, purchase a yurt kit to easily build your structure. If you’re comfortable with carpentry, search online for yurt building plans, and make each piece of the structure yourself. With some research and equipment, you can create your very own yurt.', body: '', category_id: 11, user_id: 1)

                        Article.create(
                          title: 'Be an Asset to Your Company',
                          description: 'In the world of finance, an asset is something that puts money in your pocket. In the world of business, an employee is hired to do the same thing for a company. An employee uses their knowledge and skills to earn money for themselves and their employer. Over time, an employee can increase their value to a company to a point where they become indispensable. Use the following steps to become an asset to your company.',
                           body: '', category_id: 18, user_id: 2)


Comment.create(body: 'The bastille day worth being celebrated', article_id: 2, user_id: 1)

Comment.create(body: 'You should even have a gun motherfucker', article_id: 1, user_id: 3)
Comment.create(body: 'You are right', article_id: 1, user_id: 2)

Comment.create(body: 'Do your best every day tring to wipe people from their positions, yayyy!!', article_id: 4, user_id: 1)
Comment.create(body: 'Nooooooooo nooo and nooo!', article_id: 4, user_id: 2)
