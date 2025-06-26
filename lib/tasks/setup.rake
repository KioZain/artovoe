namespace :setup do
  desc "Setup project"
  task all: :environment do
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
@names = [
  "Саша Суздальцев",
  "Арина Шабанова",
  "Анна Касс",
  "Алексей Дубинский",
  "Лена Марру",
  "Наташа Гончарова",
  "Елизавета Глушкова",
  "TONY.WWWWW",
  "Дмитрий Самыгин",
  "Дмитрий Кавка",
  "Юань – Вен Ван",
  "Катя Бровкина",
  "Александра Бурмистрова",
  "Полина Коваль",
  "Маша Богатова",
  "Женя Власова",
  "Катерина Грань",
  "Катя Афонина",
  "Bebonce",
  "Наташа Львова",
  "Kinetic Levi",
  "Facultative works",
  "Numen",
  "SAMPLE. UNITS",
  "LETTER YOU",
  "Бюро Правда",
  "LICK MY BRICK",
  "Таня Прыставка",
  "Supaform",
  "sashaxsasha",
  "Eburet",
  "ЮН-1-1"
]
@cities = [ "Москва", "Санкт-Петербург", "Казань", "Екатеринбург", "Новосибирск", "Владивосток", "Махачкала" ]
@exibition_names = [
  "Центр современного искусства «Винзавод»",
  "Музей современного искусства «Гараж»",
  "Галерея Триумф",
  "Галерея «Небеса»",
  "PA Gallery",
  "Postrigay Gallery",
  "Syntax Gallery",
  "Центр «Марс»",
  "Музей Artdynamics",
  "VR Gallery",
  "Галерея «КультПроект»",
  "Kupol Gallery",
  "ЛУЧ",
  "M.A.R.S.H.",
  "Monart",
  "Музей Эрарта",
  "Галерея Myth",
  "Галерея Kgallery",
  "Галерея Марины Гисич",
  "Галерея Анна Нова",
  "Центральный выставочный зал Манеж",
  "Центр современного искусства имени Сергея Курёхина",
  "Kunsthalle nummer sieben",
  "Павильон Новой Голландии",
  "Lazarev Gallery",
  "Галерея Бертгольд центра",
  "Marina Gisich Gallery",
  "Bashmakov Gallery",
  "One's Mind"
]
@contacts = [ "@neuro_edge", "@VoidPulse", "@shadow-wave", "@cipher_bloom", "@freq.split", "@MIND_rift", "@noise_frame",
              "@lightCORE", "@echo.grid", "@form_SHIFT", "@zen-pix", "@null_space", "@PRISM_tear", "@byte.flow", "@quark_skin" ]
@bios = [
  "Ворует облезлые ковры из подъездов и пропитывает их алкоголем из луж, чтобы 'запечатлеть запах умирающих осеней'. Гобелены сушатся на батареях в подвале, где живёт его кот-алкоголик. Галерейщики жаловались, что ковры пахнут 'тоской и картофаном', но это было до того, как они начали шептать стихи из школьной хрестоматии.",
  "Лепит из глины, добытой лопатой в парке, 'портреты тех, кто не смог уехать'. Глина замешивается на слезах, собранных в пивнушке за углом. Скульптуры хранятся под кроватью в общежитии, а ночью, по слухам, учат материться местных тараканов. Одна работа сожрала паспорт куратора.",
  "Рисует карты вымышленных городов углём из костра во дворе. Утверждает, что улицы ведут в 'никуда, откуда не возвращаются'. Подпольщики используют карты для нелегальных переходов границ, но чаще находят только свалки. Последний атлас пропал вместе с тремя бомжами и ящиком водки.",
  "Делает дудки из старых водопроводных труб и играет на них под мостом. Звук напоминает 'плач ржавого медведя'. После концертов в подземном переходе у зевак прорастают в карманах семена одуванчиков. Полиция конфисковала инструмент, приняв его за самодельное оружие.",
  "Вяжет из ниток, спёрнутых в магазине 'Всё по 50', шарфы, которые якобы 'греют душу'. Продаёт их на чёрном рынке у метро, завернув в газеты с кроссвордами. Покупатели жалуются, что шарфы начинают петь шансон, если их надеть в полнолуние. Два штука арестованы как 'предметы культа'.",
  "Выращивает грибы в картонных коробках из-под китайской еды. Говорит, что это 'сады из чужих секретов'. Грибы светятся в темноте и шепчут сплетни, услышанные в подъезде. Один ящик с грибами сожрали бездомные, после чего они неделю пели арии из 'Евгения Онегина'.",
  "Пишет портреты на обоях, содранных со стен съёмных квартир. Краски делает из кошачьей мочи и ржавчины с крыш. Говорит, что портреты — это 'предсказания, которые сбываются задним числом'. Один коллекционер умер от инфаркта, обнаружив в рамке таракана с его именем.",
  "Строит 'дома-призраки' из фанеры и скотча в заброшенных цехах. Чтобы попасть внутрь, нужно принести в жертву старый носок. В 'комнатах' вечно пахнет перегаром 1995 года. Последний посетитель застрял между стенами и теперь требует политического убежища.",
  "Ловит грозы в ржавые ведра, украденные со стройки. Говорит, что молнии — это 'стихи, которые боги пишут на обоях вселенной'. Вёдра хранятся в подвале с бомжом-философом. Если открыть два ведра сразу, начинается дождь из квитанций за коммуналку. Полиция расследует связь с серией пожаров.",
  "Шьёт костюмы из полиэтилена и фольги, найденных на помойке. Утверждает, что они 'делают невидимыми для систем слежения'. Костюмы продаются через Telegram-канал 'Анти-Сбербанк'. Последний покупатель растворился в воздухе, оставив после себя запах жареной картошки и три пустые бутылки.",
  "Вырезает фигурки из старых плинтусов и дверных ручек. Говорит, что это 'души вещей, умерших от равнодушия'. Фигурки хранятся в холодильнике, найденном на свалке. Одна из них сбежала и теперь терроризирует кошек в районе, требуя 'вернуть её в стену'.",
  "Собирает осколки битых зеркал и вставляет их в рамы из старых окон. Говорит, что отражения в них показывают 'жизнь, которой у тебя не будет'. Люстры воруют эмоции: после часа в галерее люди начинают говорить голосом Армена Джигарханяна. Две работы конфискованы как 'потенциально опасные'.",
  "Копирует рисунки волн с помощью гвоздя и досок, спёрнутых у строителей. Говорит, что это 'последние записи утопленников'. Рисунки продаются в пакетах из-под чипсов. Последний покупатель утонул в луже, оставив после себя ракушку с надписью 'Извините'.",
  "Варит джем из ягод, собранных в промзоне. Говорит, что это 'съедобный смог'. Продаёт в стеклянных банках из-под детского питания на рынке 'Черкизон'. Роспотребнадзор начал проверку после того, как джем в банке начал ругаться матом и требовать политического убежища.",
  "Лепит из глины и окурков 'диалоги, которые не случились'. Глина замешивается на воде из лужи у наркоши. Скульптуры оживают ночью и ругаются на трёх языках. Одна из них сбежала и теперь работает нелегальным гидом по подземным тоннелям.",
  "Вышивает на обрывках занавесок нитками из старых кроссовок. Узоры повторяют 'тени, которые ты оставил в прошлой жизни'. Работы хранятся в коробке из-под телевизора, спрятанной в подвале. Последняя вышивка укусила галериста, оставив след в виде QR-кода, ведущего в даркнет.",
  "Создаёт витражи из бутылочного стекла и ржавых гвоздей. Говорит, что это 'окна в параллельные миры, где все пьют самогон'. Витражи плачут кислотным дождём, если на них смотреть дольше пяти минут. Один коллекционер ослеп, увидев в стекле 'слишком много правды'.",
  "Плетёт корзины из проволоки, спёрнутой с заброшенной железной дороги. Говорит, что они 'ловят звуки из чужих снов'. Корзины используются для контрабанды нелегальных стихов. Последняя партия пропала вместе с поездом-призраком.",
  "Рисует портреты теней из-под кровати, используя сажу и слюни. Говорит, что это 'лица тех, кто тебя переживёт'. Картины оживают в новолуние и требуют сигареты. Один коллекционер исчез, оставив после себя только тень с его прической.",
  "Выращивает деревья из спичек и окурков в подпольной теплице. Говорит, что это 'роща твоих несостоявшихся жизней'. Листья шепчут советы, которые всегда заканчиваются фразой 'но это не точно'. Последний сад сгорел, оставив после себя пепел с запахом детства."
]
@titles = [
  "Безмолвие",
  "Когда листья падают вверх и время течёт сквозь пальцы",
  "Пыль",
  "Метаморфоза #247",
  "Под слоями городского шума и умирающих надежд",
  "Хрусталь",
  "В поисках утраченного цвета между параллельными мирами",
  "Осколки воображаемого пространства",
  "Антиматерия снов",
  "Черный квадрат",
  "Октябрьский дождь наизнанку",
  "Пустота",
  "За гранью видимого спектра тишины",
  "Невесомость мыслей в квадрате",
  "Здесь и сейчас",
  "Перекрёсток семи ветров",
  "Эфемерность",
  "В глубине искажённых отражений",
  "Точка",
  "Последний день лета, длящийся вечность",
  "Симфония разбитых зеркал и забытых обещаний",
  "Ноль",
  "Где кончается реальность",
  "Parallelogram of emptiness",
  "Фибра забытых координат",
  "Спектр без источника",
  "Эхо нулевой точки",
  "Гравитация тени",
  "Полифония пепла",
  "Кристаллизация невысказанных диалогов",
  "Вакуум между секундами",
  "Симулякр утраченного тепла",
  "Резонанс пустых скрипичных корпусов",
  "Метафора, растворенная в ацетоне",
  "Где горизонт складывается в оригами вечности",
  "Сутки, свернутые в спираль из перегоревших ламп",
  "Артефакты из параллельного геологического периода",
  "Квантовый шепот в перчатке из статического шума",
  "Палитра, выжженная на сетчатке закрытых глаз",
  "Феномен №0 (после конца шкалы)",
  "Архив Z-8: неидентифицированные эмоции",
  "Labyrinth of unasked questions",
  "Chaos in parentheses (Хаос в скобках)",
  "Геометрия del silencio",
  "Ветер в пасти тишины",
  "Тепло замерзшего пламени",
  "Карта звезд, нарисованных мокрым углем",
  "Отсутствие как форма присутствия",
  "Бесконечность в режиме ожидания",
  "Абстракция минус самоабстракция",
  "Без названия",
"Трансформация, из серии «Яйцо»",
"Утренний рейс",
"Триптих «Священная долина»",
"Испуганная нимфа",
"Дом детства",
"Большой кувшин. Сирена",
"Большой кувшин",
"Муза. Голова 7",
"Муза. Голова 5",
"Муза. Голова 3",
"Муза. Голова 1",
"Благая весть",
"Из серии «Окаменей»",
"Ночная",
"untitled w 021",
"untitled w 020",
"untitled w 019",

"Что делают цветы",
"Без названия",
"Просто зеленое",
"Cinderella",
"#6 из серии “Место для побега”",
"Сочи, Красная Поляна",
"Без имени",
"Обнаженная, спускающаяся по лестнице (дань Марселю Дюшану)",
"Жак Превер",

"Кубок со змеей II",
"Ангел",
"Пикник",
"Темная лошадка",
"Всадница",
"Лик из серии «9 снов» N. 8",
"Лик из серии «9 снов» N. 4",
"Встреча в лесу",
"Воображаемый ландшафт",
"Кукольный театр",
"Кубок и змея",
"Змеевик",
"Оливье",
"Сидящая (с цветком)",
"L'eviction de Chanel"
]

@comments = [
  "Я завис на этой работе минут на десять. Что-то в ней есть… прям под кожу лезет. Не пойму, что именно, но цепляет.",
  "Ну ***! Это же почти как мои сны после бессонной ночи и кофе на голодный желудок. Красиво, жутко, знакомо.",
  "Очень чувствуется дыхание автора. Не просто картинка, а состояние. Спасибо за это.",
  "Выглядит как будто мир только что закончился, но ты один это заметил.",
  "Кажется, я это уже видел… где-то между 3 и 4 утра, когда реальность немного подвисает. Сильно.",
  "Я конечно не эксперт, но мне реально зашло. Будто музыка глазами.",
  "Столько пустоты, что аж внутри что-то двинулось. Как будто всё это уже было, только молча.",
  "Объясните, пожалуйста, что я только что посмотрел. Это гениально или я просто тупой?",
  "Я не уверен, что понял, но почему-то хочу распечатать и повесить у себя в ванной. Это комплимент.",
  "Очень тонко. Вижу и боль, и красоту, и что-то ещё… трудно описать словами. Прям в сердце.",
  "Не люблю абстракции, но эта меня достала. Честно. Спасибо автору, даже если он сам не понял, как у него вышло.",
  "Иногда искусство — это просто способ выжить. Спасибо, что делитесь этим.",
  "Как будто кто-то вскрыл мой внутренний ящик с вещами, которые я даже не знал, что храню.",
  "А можно купить это? Или хотя бы украсть морально? Потому что чёрт возьми, оно мне нужно.",
  "Знаешь, я сначала ржал, а потом подумал. И вот уже пятый раз смотрю. Нормально ты делаешь. Давай ещё."
]


@collection_titles = [
  "Эхо вне времени",
  "Пейзажи внутренней пустоты",
  "Формы, потерянные в тишине",
  "Сны из параллельных измерений",
  "Осколки восприятия",
  "Мифология повседневного",
  "Свет в темноте мысли",
  "Переплетение реальностей",
  "Тени забытых чувств",
  "Точка и бесконечность",
  "Призрачные маршруты",
  "Коллекция недосказанностей",
  "Архив невидимого",
  "Спектры и симулякры",
  "Геометрия сна",
  "Звёзды на чёрной скатерти",
  "Тепло и его призраки",
  "Женские лица времени",
  "Медленные катастрофы",
  "Места для побега",
  "Истории без имён",
  "Заброшенные состояния",
  "Цветы, которые думают",
  "Вещи, которые не сказали",
  "Хрупкие горизонты",
  "Субъективная археология",
  "Театр воображения",
  "Голоса через стекло",
  "Вне координат",
  "Природа без центра"
]

@collection_descriptions = [

  "Эта коллекция — как дыхание между снами. Пространство, где формы растворяются, а тишина говорит громче слов. Здесь искусство становится попыткой услышать невидимое и поймать мимолётное. Всё зыбко, как пар от горячей чашки на рассвете.",

  "Исследование зыбкой границы между присутствием и исчезновением. Работы в этой серии будто бы не нарисованы, а проявлены из внутреннего света. Они живут в полутоне и тени мысли. Здесь важно не то, что видно, а то, что чувствуется между линиями.",

  "Коллекция о недосказанном, о паузах между словами, о взгляде, который не успел дойти до объекта. Это визуальный дневник хрупких состояний и зыбких ощущений. Каждая работа — как письмо без адресата, оставленное на ветру.",

  "В этих работах реальность расслаивается на пластинки воспоминаний, грёз и фрагментов времени. Каждое изображение — как окно в версию мира, в которой всё устроено немного иначе. Тут возможно всё, кроме однозначного прочтения.",

  "Серия, в которой встречаются природное и абстрактное, эмоциональное и структурное. Это не пейзажи, но следы присутствия природы в восприятии человека. Цвета дышат, формы текут, как если бы сам воздух решил заговорить.",

  "Словно после землетрясения, здесь остаются лишь детали — трещины, текстуры, намёки. Эта коллекция говорит не напрямую, а через остатки и следы того, что уже исчезло. Молчание здесь не пусто, оно наполнено эхом.",

  "Работы соединяют миф и повседневность. Сюжеты здесь напоминают фрески из памяти, где древние архетипы живут в современной оболочке. В этих образах можно узнать себя, если смотреть достаточно долго.",

  "Серия собрана как набор визуальных вопросов, на которые не существует прямого ответа. Это искусство, которое предлагает задуматься, а не понять. Оно оставляет пространство для собственного чтения и личного заблуждения.",

  "Здесь цвет и форма действуют как независимые силы. Работы не описывают, а создают собственную атмосферу — сложную, иногда тревожную, но всегда притягательную. Это эстетика на грани ощущения и импульса.",

  "Это коллекция переходных состояний: между ночью и утром, сном и бодрствованием, реальностью и симуляцией. Всё зыбко, всё нестабильно — и в этом особая правда. Ничто не держится за форму, и всё стремится стать чем-то другим."
]
@work_descriptions = [

  "На первый взгляд — тишина. Но если всмотреться, в этой работе начинает пульсировать внутреннее движение: легкий дрожащий ритм, как дыхание во сне. Поверхность будто запомнила прикосновение света и сохранила его в виде вибрации цвета и формы. Здесь нет начала и конца — только бесконечное колебание между чем-то ещё не сказанным и тем, что уже растворилось в воздухе. Работа существует на стыке внимания и забвения, напоминая зрителю: иногда главное — не увидеть, а ощутить грань исчезающего.",

  "Эта работа — попытка поймать течение времени вне привычного хода часов. Всё изображённое здесь как будто задержано в точке, где прошлое и будущее сливаются в один миг. Цвета дрожат на грани исчезновения, линии теряют устойчивость. Это не пейзаж и не портрет — скорее, внутреннее пространство, в которое можно погрузиться. Художник предлагает не объяснение, а опыт, в котором зритель теряет опору и выходит в зону, где работает только интуиция и память, превращённая в образ.",

  "Работа похожа на сон, в котором ты знаешь, что происходит что-то важное, но не можешь точно объяснить — что именно. Всё здесь подчинено не логике, а внутреннему ритму: цвета будто слышат музыку, недоступную нам, а формы складываются в символы, знакомые, но забытые. Это произведение не предлагает сюжета, но даёт состояние. Оно оставляет после себя ощущение будто ты долго смотрел в туман и вдруг что-то понял — не словами, а кожей. Это искусство работает не на зрение, а на присутствие.",

  "Перед нами — не просто изображение, а архив эмоций, зафиксированных на пороге исчезновения. В каждом элементе — воспоминание, в каждом слое — отражение внутреннего. Художник работает как археолог: слой за слоем вскрывает чувства, забытые смыслы и полустёртые символы. Картина не раскрывает себя сразу, но предлагает возвращаться к ней снова и снова. С каждым взглядом она становится другой, потому что изменяется не только она, но и тот, кто смотрит. Это произведение — зеркало, но не отражающее, а вспоминающее.",

  "Композиция устроена как лабиринт: взгляд то уходит вглубь, то возвращается к поверхности. Визуальные элементы будто ведут за собой, но оставляют в недоумении. Автор не даёт ответа, а подталкивает к личному вопросу. Картина живёт на границе формы и рассыпающегося образа. Она полна напряжения — не внешнего, а внутреннего, почти кинематографического. Это момент перед чем-то важным, момент задержанного дыхания. Всё сжато до предела, и этот предел чувствуется даже сквозь цвет и мазок.",

  "Работа говорит о хрупкости. О тонком равновесии между существованием и отсутствием. Цвета здесь — не просто оттенки, а эмоциональные поля, в которых зритель может потеряться. Контуры расплываются, как воспоминания, ускользающие сквозь пальцы. Художник создаёт пространство, в котором ничто не закреплено навсегда. Каждая деталь может исчезнуть — и именно поэтому она так значима. Это произведение напоминает дыхание в морозном воздухе: живое, текучее, мгновенное. И в этом — его поэзия.",

  "Это не изображение, а высказывание. Не картина, а почти философский тезис, зашифрованный в визуальной форме. Каждый элемент работы может быть прочитан как знак, каждый цвет — как акцент. Художник приглашает к чтению, но не даёт ключей. Ощущение, будто смотришь на следы чужой мысли, оставленные на границе сна и бодрствования. Это искусство сопротивляется упрощению. Оно требует времени. И в этом — его главная ценность: оно не хочет нравиться, оно хочет остаться в памяти.",

  "Это произведение построено на контрастах. На трении между твёрдым и мягким, между углом и изгибом, между контролем и свободой. Здесь нет случайных решений — всё выверено, но при этом живёт, дышит, движется. Работа оставляет ощущение, будто ты слышишь внутренний голос автора, но не понимаешь слов. Только тембр. Только пульс. Это визуальный монолог, в котором каждый зритель становится слушателем на своей волне.",


  "Работа — как фрагмент реальности, вырезанный из общего потока и помещённый под стекло. Но стекло мутное, слегка искажает, заставляя сомневаться: правда ли ты это видишь, или только додумываешь. Художник играет с памятью и вниманием. Здесь важно не только то, что изображено, но и то, что упущено. В этом произведении тишина — не фон, а часть композиции. В нём нет финала, только открытые двери. Смотри — и додумывай сам.",

  "В этой работе можно почувствовать ветер. Нет, не буквальный — внутренний, почти метафизический. Всё здесь колышется, сдвигается, вибрирует. Цвет словно дышит, а линии пульсируют под кожей холста. Автор создаёт впечатление движущегося статика — как если бы время застыло, но пространство продолжало меняться. Это не просто изображение — это ритм, переведённый в визуальную форму. Работу хочется не только смотреть, но и проживать."
]


# Rake-----------------------------------------
# def reset_db
#   Rake::Task['db:drop'].invoke
#   Rake::Task['db:create'].invoke
#   Rake::Task['db:migrate'].invoke
# end

# def destroy_all
#   Like.destroy_all
#   Collection.destroy_all
#   root_models = [ User, Profile ]

#   models = ActiveRecord::Base.descendants.reject do |model|
#     model.to_s =~ /^(ActiveStorage|ActionDispatch|ActionMailer)/
#   end

#   models.sort_by { |model| root_models.include?(model) ? 1 : 0 }
#         .reverse_each do |model|
#     next unless model.table_exists?
#     puts "Destroying all records from #{model.name.pluralize}..."
#     model.destroy_all
#   end
# end


# Setting the quantity of posts and comments --------------------
def seed
  # reset_db
  destroy_all
  create_users(28)
  create_posts(114)
  create_comments(2..6)
  create_collections(24)
end


def upload_random_avatar
  uploader = AvatarUploader.new(Profile.new, :avatar)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, "public/autoupload/avatars", "*")).sample))
  uploader
end

def create_users(quantity)
  i = 0

  quantity.times do
    user_data = {
      email: "user_#{i}@email.com",
      password: "testtest"
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
@words = @raw_text.downcase.gsub(/[—.—,«»:;()]/, "").gsub(/  /, " ").split(" ")

def create_sentence
  sentence_words = []

  (10..20).to_a.sample.times do
    sentence_words << @words.sample
  end
  sentence = sentence_words.join(" ").capitalize + "."
end

# Image creating ----------------------------------------
def upload_random_image
  # uploader = PostImageUploader.new(Post.new, :post_image)
  # uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/autoupload/posts', '*')).sample))
  # uploader
  image_path = Dir.glob(File.join(Rails.root, "public/autoupload/posts", "*")).sample
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
      body: @work_descriptions.sample,
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

    total_displays = rand(3..18)

    current_total = 0
    loop do
      group_size = [ 2, 3 ].sample
      group_size = total_displays - current_total if current_total + group_size > total_displays

      year = rand(2000..2023).to_s

      group_size.times do
        post.displays.create!(
          name: @exibition_names.sample,
          year: year,
          display_type: [ "Выставка", "Арт-маркет", "Галерея", "Музей" ].sample,
          city: @cities.sample
        )
      end

      current_total += group_size
      break if current_total >= total_displays
    end

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
        body: @comments.sample
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
      title: @collection_titles.sample,
      body: @collection_descriptions.sample,
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

def add_posts_to_collection(collection)
  user_posts = Post.where(user: collection.user)
  return false if user_posts.count < 3

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
  end
end
