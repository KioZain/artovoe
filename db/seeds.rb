@artists = [
  {
    "name": "Barot Bellingham",
    "shortname": "Barot_Bellingham",
    "reknown": "Royal Academy of Painting and Sculpture",
    "bio": "Barot has just finished his final year at The Royal Academy of Painting and Sculpture, where he excelled in glass etching paintings and portraiture. Hailed as one of the most diverse artists of his generation, Barot is equally as skilled with watercolors as he is with oils, and is just as well-balanced in different subject areas. Barot's collection entitled \"The Un-Collection\" will adorn the walls of Gilbert Hall, depicting his range of skills and sensibilities - all of them, uniquely Barot, yet undeniably different"
  },
  {
    "name": "Jonathan G. Ferrar II",
    "shortname": "Jonathan_Ferrar",
    "reknown": "Artist to Watch in 2012",
    "bio": "The Artist to Watch in 2012 by the London Review, Johnathan has already sold one of the highest priced-commissions paid to an art student, ever on record. The piece, entitled Gratitude Resort, a work in oil and mixed media, was sold for $750,000 and Jonathan donated all the proceeds to Art for Peace, an organization that provides college art scholarships for creative children in developing nations"
  },
  {
    "name": "Hillary Hewitt Goldwynn-Post",
    "shortname": "Hillary_Goldwynn",
    "reknown": "New York University",
    "bio": "Hillary is a sophomore art sculpture student at New York University, and has already won all the major international prizes for new sculptors, including the Divinity Circle, the International Sculptor's Medal, and the Academy of Paris Award. Hillary's CAC exhibit features 25 abstract watercolor paintings that contain only water images including waves, deep sea, and river."
  },
  {
    "name": "Hassum Harrod",
    "shortname": "Hassum_Harrod",
    "reknown": "Art College in New Dehli",
    "bio": "The Art College in New Dehli has sponsored Hassum on scholarship for his entire undergraduate career at the university, seeing great promise in his contemporary paintings of landscapes - that use equal parts muted and vibrant tones, and are almost a contradiction in art. Hassum will be speaking on \"The use and absence of color in modern art\" during Thursday's agenda."
  },
  {
    "name": "Jennifer Jerome",
    "shortname": "Jennifer_Jerome",
    "reknown": "New Orleans, LA",
    "bio": "A native of New Orleans, much of Jennifer's work has centered around abstract images that depict flooding and rebuilding, having grown up as a teenager in the post-flood years. Despite the sadness of devastation and lives lost, Jennifer's work also depicts the hope and togetherness of a community that has persevered. Jennifer's exhibit will be discussed during Tuesday's Water in Art theme."
  },
  {
    "name": "LaVonne L. LaRue",
    "shortname": "LaVonne_LaRue",
    "reknown": "Chicago, IL",
    "bio": "LaVonne's giant-sized paintings all around Chicago tell the story of love, nature, and conservation - themes that are central to her heart. LaVonne will share her love and skill of graffiti art on Monday's schedule, as she starts the painting of a 20-foot high wall in the Rousseau Room of Hotel Contempo in front of a standing-room only audience in Art in Unexpected Places."
  },
  {
    "name": "Constance Olivia Smith",
    "shortname": "Constance_Smith",
    "reknown": "Fullerton-Brighton-Norwell Award",
    "bio": "Constance received the Fullerton-Brighton-Norwell Award for Modern Art for her mixed-media image of a tree of life, with jewel-adorned branches depicting the arms of humanity, and precious gemstone-decorated leaves representing the spouting buds of togetherness. The daughter of a New York jeweler, Constance has been salvaging the discarded remnants of her father's jewelry-making since she was five years old, and won the New York State Fair grand prize at the age of 8 years old for a gem-adorned painting of the Manhattan Bridge."
  },
  {
    "name": "Riley Rudolph Rewington",
    "shortname": "Riley_Rewington",
    "reknown": "Roux Academy of Art, Media, and Design",
    "bio": "A first-year student at the Roux Academy of Art, Media, and Design, Riley is already changing the face of modern art at the university. Riley's exquisite abstract pieces have no intention of ever being understood, but instead beg the viewer to dream, create, pretend, and envision with their mind's eye. Riley will be speaking on the \"Art of Abstract\" during Thursday's schedule"
  },
  {
    "name": "Xhou Ta",
    "shortname": "Xhou_Ta",
    "reknown": "China International Art University",
    "bio": "A senior at the China International Art University, Xhou has become well-known for his miniature sculptures, often the size of a rice granule, that are displayed by rear projection of microscope images on canvas. Xhou will discuss the art and science behind his incredibly detailed works of art."
  }
]

@price = [ 10000, 500, 200, 2200, 3200, 4200, 6200 ]
@categories = [ "ювелирка", "картина", "скульптура", "текстиль", "полиграфия", "диджитал-арт" ]

# Profile Content
@names = [ "digitalnyan", "kiozain", "zlatko", "tuberkulexa", "Чхыф", "humanim4lien", "somebody", "nobody31", "shoegazer", "волчок" ]
@cities = [ "Москва", "Санкт-Петербург", "Казань", "Екатеринбург", "Новосибирск", "Владивосток", "Махачкала" ]
@exibition_names = [ 'OGO×WOW' 'Market', 'YRA Fest', 'WinWin' ]
@contacts = [ "@neuro_edge", "@VoidPulse", "@shadow-wave", "@cipher_bloom", "@freq.split", "@MIND_rift", "@noise_frame",
              "@lightCORE", "@echo.grid", "@form_SHIFT", "@zen-pix", "@null_space", "@PRISM_tear", "@byte.flow", "@quark_skin" ]
@bios = [
  "Собирает запахи ушедшего лета и вплетает их в гобелены из паучьего шёлка. Говорит, что его лучшая работа — аромат дождя, который так и не выпал. Утверждает, что ткацкий станок ему подарил говорящий куст. Гобелены оживают ночью, чтобы спорить о философии с кухонной мебелью. Покупатели жалуются, что их дома теперь пахнут апрельскими сомнениями.",
  "Лепит скульптуры из тишины, оставшейся после нерождённых слов. Утверждает, что глина шепчет ему рецепты забытых пирогов. Все его работы хранятся в холодильнике, чтобы они не растаяли от лишнего шума. Если случайно задеть скульптуру локтем, она начинает декламировать стихи на языке, который выучил во сне. Однажды его «Безмолвный диалог» съел соседский кот, оставив после себя только запах шоколадного печенья.",
  "Рисует карты несуществующих городов, используя только кофейную гущу и отпечатки пальцев сов. Каждая улица ведёт в пункт назначения «Нигде». Однажды нарисовал город, где все жители были сделаны из воздушных шаров. Говорит, что карты нужно хранить в коробках из-под пиццы, иначе они начнут прорастать грибами. Последний атлас пропал, оставив после себя запах карамелизированной тоски.",
  "Создаёт музыкальные инструменты из застывших вздохов. Его скрипка из апельсиновой корки звучит как крик мартовского кота. Иногда играет концерты для деревьев, но они всегда заканчиваются внезапным ливнем. Утверждает, что его арфа из старых календарей может предсказать конец света, но она всегда врёт. После выступления зрители обычно находят в карманах семена неизвестных растений.",
  "Вяжет шарфы из северного сияния. Каждая петля исчезает на рассвете, оставляя после себя запах полыни. Шарфы продаются только ночью, и покупатели обязаны вернуть их до восхода солнца. Если надеть шарф наизнанку, можно услышать, как северные олени поют рэп. Однажды его коллекция растворилась в полночь, оставив после себя стаю светлячков, говорящих на латыни.",
  "Выращивает сады из эхо прошлых разговоров. Цветы расцветают только тогда, когда никто не смотрит. Если случайно услышать их шорох, можно узнать чужие секреты. Говорит, что розы из сплетен нужно поливать слезами, а кактусы из сарказма — виски. Последний урожай превратился в стаю ворон, укравших все чётные числа из календаря.",
  "Пишет портреты людей, которые ещё не родились, используя краски из тумана и пепла сожжённых писем. Подписывает их именами вымерших звёзд. Говорит, что каждый портрет — это предложение будущему, которое иногда отклоняется. Если долго смотреть на холст, начинаешь слышать, как нерождённые дети спорят о вкусе луны. Одна картина укусила критика за палец, оставив след в виде созвездия Пегаса.",
  "Строит дома из географических координат снов. Каждая комната находится в другом часовом поясе. Попасть внутрь можно только через дверь, которая открывается ключом из солёной воды. В подвале всегда 1997 год, а на чердаке — следующий вторник. Последний жилец исчез, оставив после себя рецепт варенья из облаков и пачку непроявленных снов.",
  "Ловит молнии в стеклянные бутылки и превращает их в стихи. Говорит, что гром — это рифмы, которые не влезли в строфу. Его бутылки хранятся в подвале, где время идёт задом наперёд. Если открыть две бутылки одновременно, начинается дождь из календарных дат. Однажды его стихотворение оженилось с грозовой тучей, и теперь они воспитывают трёх маленьких торнадо.",
  "Шьёт костюмы из зеркальных облаков. В них невозможно увидеть своё отражение, только чужие сны. Каждый костюм действует как портал в параллельную реальность, но работает только по вторникам. Если надеть два костюма сразу, можно застрять между воспоминаниями о завтраке и страхом перед третьим куском торта. Последняя коллекция вызвала эпидемию дежавю в трёх штатах.",
  "Вырезает фигурки из застывшего смеха. Утверждает, что самые громкие шутки получаются из январской тишины. Фигурки начинают таять, если кто-то рядом расскажет анекдот. Говорит, что лучшие работы хранятся в коробках из-под печенья, чтобы они не забыли вкус радости. Однажды его скульптура «Ха-Ха» улетела в космос, оставив после себя запах жареных галактик.",
  "Собирает кристаллы сожалений и встраивает их в люстры. Когда они плачут, комната наполняется запахом недопетых песен. Люстры работают только при свете свечей, зажжённых от сердца. Если повесить люстру в ванной, вода начинает цитировать Фрейда. Последняя модель устроила мятеж, требуя, чтобы её подключили к розетке из детских страхов.",
  "Копирует рисунки волн, оставшихся на песке после отлива. Работает только в те дни, когда море забывает свои границы. Говорит, что каждая волна подписана именем древней рыбы. Если долго рассматривать его наброски, начинаешь слышать, как крабы поют хором. Однажды его альбом превратился в аквариум, населённый философствующими медузами.",
  "Варит джем из тумана и разливает его в банки с наклейками «Съедобное небо». Говорит, что облака — это просто недооценившие себя комары. Джем особенно вкусный, если есть его на крыше во время заката. Утверждает, что каждая банка содержит в себе кусочек апрельского дождя. Последняя партия вызвала эпидемию поэзии среди местных бабушек.",
  "Лепит из глины диалоги, которые так и не случились. Готовит их в печи, топящей углём из сожжённых дневников. Говорит, что некоторые фразы слишком горячие, чтобы их трогать голыми руками. Если случайно разбить скульптуру, из неё вылетают все непрожитые моменты. Однажды его «Несказанное» превратилось в стаю соловьёв, поющих на языке эсперанто.",
  "Вышивает на воде узоры из лунного света. Каждая нить растворяется на рассвете, оставляя после себя ртутный блеск. Узоры видны только тем, кто умеет плакать без причины. Говорит, что лучшие работы создаются в полночь под аккомпанемент лягушачьего хора. Последняя вышивка уплыла в океан, оставив после себя запах невыполненных обещаний.",
  "Создаёт витражи из застывших гроз. Утверждает, что молнии — это просто нервные линии, которые не смогли расслабиться. Витражи меняют цвет в зависимости от настроения человека, который на них смотрит. Если дотронуться до витража во время грусти, он начинает петь арии из опер, которых не существует. Однажды его окно превратилось в дверь, ведущую в прошлое, но там стояла очередь из философов.",
  "Плетёт корзины из голосов птиц, улетевших на юг. Каждая прореха в них — это нота, забытая ветром. Корзины используются только для сбора звёзд, упавших с неба. Говорит, что самые крепкие корзины получаются из трелей соловья, смешанных с пылью от комет. Последняя партия корзин начала собирать не только звёзды, но и чужие мечты, что вызвало переполнение склада.",
  "Рисует портреты теней, отбрасываемых невидимыми людьми. Использует краски из пыли под диваном и кошачьей нежности. Тени иногда шепчут ему советы, но он никогда не слушает. Говорит, что каждый портрет — это билет в автобусе, который едет в никуда. Однажды его выставка вызвала бунт теней, потребовавших себе зарплату и выходные дни.",
  "Выращивает деревья из застывших «почти»: почти поцелуев, почти побед, почти признаний. Их листья шелестят на языке, который ещё не придумали. Деревья могут расти только в тех местах, где люди часто теряют надежду. Если сорвать лист, можно услышать, как твоя собственная жизнь разговаривает с тобой голосом детства. Последний сад превратился в лабиринт, где каждый поворот ведёт к чужому воспоминанию."
]
@titles = [ "Безмолвие", "Когда листья падают вверх и время течёт сквозь пальцы", "Пыль", "Метаморфоза #247", "Под слоями городского шума и умирающих надежд", "Хрусталь", "В поисках утраченного цвета между параллельными мирами", "Нити", "Осколки воображаемого пространства", "42", "Антиматерия снов", "Черный квадрат", "Октябрьский дождь наизнанку", "Пустота", "За гранью видимого спектра тишины", "Вопреки", "Петля", "Невесомость мыслей в квадрате", "Здесь и сейчас", "Перекрёсток семи ветров", "Эфемерность", "В глубине искажённых отражений", "Точка", "Последний день лета, длящийся вечность", "Полёт", "Симфония разбитых зеркал и забытых обещаний", "Ноль", "Где кончается реальность", "Вдох", "Parallelogram of emptiness" ]

# Rake-----------------------------------------
def reset_db
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
end


# Setting the quantity of posts and comments --------------------
def seed
  reset_db
  create_users(5)
  create_posts(24)
  create_comments(2..6)
  create_collections(10)
end


def upload_random_avatar
  uploader = AvatarUploader.new(Profile.new, :avatar)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/uploads/avatars', '*')).sample))
  uploader
end

def create_users(quantity)
  i = 0

  quantity.times do
    user_data = {
      email: "user_#{i}@email.com",
      password: 'testtest'
      # jti: SecureRandom.uuid
    }

    if i == 0
      user_data[:admin] = true
      puts("----------Admin created----------")
    end
    user = User.create!(user_data)
      puts "User created with id #{user.id}"
     puts "User created with JTI #{user.jti}"

     profile_data = {
      name: @names.sample,
      bio: @bios.sample,
      placed: @cities.sample,
      contact: @contacts.sample,
      avatar: upload_random_avatar
    }

    user.create_profile!(profile_data)
    puts "Profile created for user with id #{user.id}: #{profile_data[:name]}"

    i += 1
  end
end

def get_random_title
  @titles.sample
end
# Public or Private
def get_random_bool
  [ true, false ].sample
end

# Author
def create_author
  @artists.sample[:name]
end
# PostName
def create_post_name
  @artists.sample[:reknown]
end

@raw_text = "Нонспектакулярное искусство — направление в современном искусстве, отвергающее зрелищность и театральность.
Примером такого искусства является перформанс польского художника Павла Альтхамера «Script Outline», на выставке «Manifesta» в 2000 году. Manifesta – биеннале современного искусства проходит в Европе, начиная с 1996 года. Первая выставка была организовна в Роттердаме. Выставка Manifesta–3 проходила в Словении. Как отмечает куратор выставки Виктор Мизиано, в отличие от других значительных форумов Манифеста «была с самого начала определена как биеннале именно европейских молодых художников; но зато Европа здесь должна была быть представлена вся, т. е. не только Западная, но и непременно Восточная»."
@words = @raw_text.downcase.gsub(/[—.—,«»:;()]/, '').gsub(/  /, ' ').split(' ')

def create_sentence
  sentence_words = []

  (10..20).to_a.sample.times do
    sentence_words << @words.sample
  end
  sentence = sentence_words.join(' ').capitalize + '.'
end

# Image creating ----------------------------------------
def upload_random_image
  image_path = Dir.glob(File.join(Rails.root, 'public/uploads/posts', '*')).sample
  File.open(image_path)
end

# Tags

# Creating posts-----------------------------------------
def create_posts(quantity)
  quantity.times do
    users = User.all.to_a
    user = users.sample

    post = Post.create!(
      title: get_random_title,
      body: create_sentence,
      author: create_author,
      post_image: upload_random_image,
      public: get_random_bool,
      user: user,
      city: @cities.sample,
      price: @price.sample,
      amount: rand(0..10),
      year: rand(1990..2025),
    )

    create_likes_for(post)

    post.material_list = MATERIAL_TAGS.sample(rand(1..3))
    post.mood_list = MOOD_TAGS.sample(rand(1..3))
    post.genre_list = GENRE_TAGS.sample(rand(1..3))
    post.theme_list = THEME_TAGS.sample(rand(1..3))
    post.category_list = @categories.sample.downcase
    post.save!

    post.displays.create(
      name: @exibition_names.sample,
      year: rand(2000..2023).to_s,
      display_type: [ "Выставка", "Арт-маркет", "Галерея", "Цифровая экспозиция" ].sample,
      city: @cities.sample,
    )

    puts "Post with id #{post.id}, user id:#{user.id}, tags: #{post.material_list}, displays: #{post.displays.count}, likes_count:#{post.likes_count} just created"
  end
end

# Creating comments-----------------------------------------
def create_comments(quantity)
  Post.all.each do |post|
    quantity.to_a.sample.times do
      user = User.all.sample
      comment = Comment.create(
        post_id: post.id,
        user_id: user.id,
        body: create_sentence
      )
      puts "Comment with id #{comment.id} for post with id #{comment.post.id} created by user #{user.email}"
    end
  end
end


def create_collections(quantity)
  quantity.times do
    user = User.all.sample
    public_status = get_random_bool

    collection = Collection.new(
      user: user,
      title: create_post_name,
      body: create_sentence,
      public: public_status
    )


    if add_posts_to_collection(collection)
      if collection.save
        puts "Collection '#{collection.title}' with id #{collection.id} created"


        create_likes_for(collection)

      else
        puts "Failed to create Collection: #{collection.errors.full_messages.join(", ")}"
      end
    else
      puts "Not enough posts for user #{user.id}"
    end
  end
end

# Добавление постов в коллекцию
def add_posts_to_collection(collection)
  user_posts = Post.where(user: collection.user)
  return false if user_posts.count < 2

  # Исправленный блок генерации post_count
  max_posts = [ user_posts.count, 8 ].min
  min_posts = 3
  post_count = rand(min_posts..max_posts)

  posts_to_add = user_posts.sample(post_count).uniq

  posts_to_add.each do |post|
    collection.posts << post unless collection.posts.include?(post)
    puts "Post #{post.id} added to Collection '#{collection.title}'"
  end

  true
end

def create_likes_for(likable)
  users = User.where.not(id: likable.user.id).to_a
  max_likes = users.size
  likes_count = rand(0..max_likes)
  liking_users = users.sample(likes_count).uniq

  liking_users.each do |liker|
    Like.find_or_create_by!(
      likable: likable,
      user: liker
    )
  end
end

seed
