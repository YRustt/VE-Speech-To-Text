

### Установка на Windows

* Нужен python3.6.

* Установка `SpeechRecognition`:
```
pip install SpeechRecognition
```

[Документация](https://pypi.org/project/SpeechRecognition/).

* Установка `pocketsphinx`: можно скачать [здесь](https://pypi.org/project/pocketsphinx/#files).

* Скачивание обученной модели для русского языка на основе HMM: [здесь](https://sourceforge.net/projects/cmusphinx/files/Acoustic%20and%20Language%20Models/Russian/). 

Делаем так, чтобы получилась следующая иерархия файлов и каталогов:
```
pocketsphinx-data \
    ru-RU \
        acoustic-model \
            {model' files}
        language-model.lm.bin
        pronounciation-dictionary.dict
```
и подкладываем эти файлы в директорию: `...\AppData\Local\Programs\Python\Python36\Lib\site-packages\speech_recognition\pocketsphinx-data`.

* Установка `logmmse`.
```
pip install logmmse
```

[Документация](https://pypi.org/project/logmmse/).

* Варианты запуска:
```
python main.py --file={path\to\wav-file} denoise
python main.py --file={path\to\wav-file} recognize --type={google,sphinx} [--duration={duration}]
```

---

### Методы работы

* __Google.__ Используя библиотеку `SpeechRecognition`. Нет возможности обработать файлы, которые больше 5 минут. Для некоторых аудио не возвращается ни одного варианта текста.

* __Pocketsphinx.__ Используя библиотеки `SpeechRecognition` и `Pocketsphinx`. Работает локально и очень медленно.

---

### Примеры работы

|        | kaggle/early_short_stories_0001.wav |
|--------|-------------------------------------|
|Оригинал| За столицей мудрого царя Соломона шелестел по склонам холмов густой лес. С его опушки запутанные тропинки вели на поляну. |
|Google | за столицей Мудрого царя Соломона шелестел по склонам холмов густой лес с его опушке запутанные тропинке в Ильино поляна                                     |
|Sphinx | со столицей мудрого царя соломона шелестел по склонам холмов густой лес с его опушки запутанные тропинки вели на поляну |

|        | kaggle/early_short_stories_0002.wav |
|--------|-------------------------------------|
|Оригинал| Где происходили свидания Ариэля и Тамары. Ему было около 14 лет и ей тоже. |
|Google  | где происходили свидания Ариэль а это Мары ему было около 14 лет и ей то |
|Sphinx | где происходили свидания и карьере и тамара ему было около четырнадцати лет визитёр |

|        | kaggle/early_short_stories_0003.wav |
|--------|-------------------------------------|
|Оригинал| Но Ариэль был сыном знатного иерусалимца, одного из любимейших советников премудрого царя. |
|Google  | Ну Ариэль был сыном знатного Иерусалимская одного из любимейших советников премудрова Царя |
|Sphinx  | но арелет был сыном знатного ерусалим сам одного из любезнейший советников премудрого царя |

|        | kaggle/early_short_stories_0004.wav |
|--------|-------------------------------------|
|Оригинал| Его волосы были черны как ночь, а глаза - как уголь. А Тамара жила за городом, потому что её отцу-иноплеменнику. |
|Google  | его волосы были черны Как ночь А глаза как уголь а Тамара жила за городом потому что её отцу иноплеменников |
|Sphinx  | его волосы были черны как ночь глаза как у уголь а тамара жила за городом потому что её отцу иноплеменников |

|        | kaggle/early_short_stories_0005.wav |
|--------|-------------------------------------|
|Оригинал| Недозволялось обитать среди иудеев. Её мягкие длинные локоны были нежного тёмно-каштанового цвета. |
|Google  | не дозволялось обитать среди иудеев её мягкие длинные локоны были нежного темно каштанового цвета |
|Sphinx  | не дозволялось обитать среди иудеев её менять чьи длинные локоны были нежного темно каштанового цвета |

|        | decoder-test.wav |
|--------|------------------|
|Оригинал| Илья Ильф Евгений Петров Золотой телёнок. |
|Google  | Илья Ильф Евгений Петров Золотой телёнок  |
|Sphinx  | илья ильф евгений петров и золотой телёнок|

|        | machine.wav duration=30 |
|--------|-------------------------------|
|Оригинал|                               |
|Google  | наши ребята в чате спрашиваю там по ушным нашим алматинским горам скучаешь или нет Я им сказал что тут таких гор много-много Скучаю конечно поедем посмотришь оптом ездила до места для лазания очень много искал Егор действительно и всё в такой же если не лучше доступности как у нас стена Северная и подняли на свадьбах вообще говорят он на высоте 1200 м он запрессовывают половинами за время зимы и потом он сохраняется в течение всего года линейка называется Золушка cenerentola потому что чёрный там по всяким мусором всяким ветками камушками красивые стенки Какие моря зимой её ходил без процентов первый и наверное единственное Нет не действует он впереди порно и она показалась да потом это вот это вот остренькая но мы на неё не полезен мы там Проверь Джина Карано пранкеров упрямстве разберёмся Сегодня мы горючего Вот она вообще не замыкает Да сегодня на всякий случай Взять ключи потому что непонятно вчера хотелось парень я скажу сейчас могу быть и поинтересней немножко так по применению или нет так как не скажет проход и скручивает Запусти ценность думаешь надо а здесь что хорошо что здесь везде кафешке везде стороны сейчас будем в канале деревню проезжать там ну компьютере открыта можем сейчас созвониться айфи кофе попьём Ну давай-давай задуматься уже напились ты кофеман Нет не напились мы еще кофе адрес дома Приветик Ты дома 2 3 выходи Так это ты половину кружку потом вторую я тебе напомню старую там короче пожалуйста киска друга Давай остановимся попьём кофе в кофейне Спасибо тут руды добывают железо медь Серебро вот сейчас будем как раз приезжать Санька Лес хороший строевой туризме достаточно развит почему вот эти кафешки функционирует можно просто люди приезжают и платят за сервис как ему получается допустим он кстати показал самой высокой в этой реке 2.500 город Чита она такая получается аналог нашего ущелью туюк-су только гораздо длиннее облагораживание кафе используя Ну да наверное до 30 км да или нет Вот едем в самом верху щенка который замыкает А всё равно что мы там куда-нибудь на манжероке завести в общем-то Да ну для меня это такое аналог ассоциация Медиков как раз 600 перепад она самая крутая наверное буду в этом массиве короче Легенда такая что Последний король Италии через этот перевал вот и через другие там перевалы уходил потом Швейцарию когда начались Республиканский всякие дела и той стороны эти горы пологие Ну так сравнительную там травянистые склоны о них лежит на вершине снега Сейчас снег вот там Ну сегодня я думал мои пнем пару раз это снежок |
|Sphinx  | наши ребята всякие вашего из бо в нужно нашему в деньгам спустя решили не ввязываться в такие вот много хорнада поганые или в ночи с зря вас не хватает гордости за боярин обхода сидящим видовой стены звериные морды до по идее да места для товара не очень много искала его в действительно ли все такой же если не с от доступности бурбонов и даже в о в н достигает тысячи метров над отверженная и поверьте пальцы в имени в и уже с ними в в в с в в приведены и потом он с заключение в вода в должности не то что чёрное там нет даже камушками здания к достаточно взглядъ валентин марево и мойого дивный в первый и наверное не дам в семидесятых годах зимой в н и в в в в в бургосе народу в мало ли вот видите горном я она показала на должны будут всегда небольших в траве можно пройти на накануне в св й в н к животным и взяла тогда она учителями в нами и в селяни що ваша непонятно тебя хотя и с места и все же да в гения выжидая кто прими в скале надо вот в дикой что он самый в брюссель бельгия берлин это не надо а не в многосложных к выяснили дидона не будем в и она или вне влияния там в я к тому же они упали два берём в в пайна от родного дома и избегали магния все мав не надеялись ничто из того девятьсот две трети джигитам третий передали во второй ньятенери не все в этом и даже до дружно запомни наливал в бранд бонд и сроки и в дрожал в его медее становится таким после почтальона и влезла в эту дыру д д марта ура железами на деле было бы взять хотя бы хороший ты мой или достаточно развитая теперь я не это ли в сбылось тут банку к назад мы с ли де пятьсот вот это нам и нашим змия в пользу не население да ведь это обвинение в в в едем в самое вернулись к ввода в но от примерно в это такое но в чем они стена он в с ленина что исчез в двери бар а сам обсуждая наверно в этом мире если приберегала для будущей жизни г в очереди в этот последний король италии джеда к перевалу подвести итоги и они бы и далее в когда в точности так и не соляной горы пологий травянистый оное было некогда взгляни две отделяли вверх они могли местной никона в среде войдя в ворота в стене напильник |

|        | machine-denoise-director.wav |
|--------|-----------------------------------------------------|
|Оригинал|                                                     |
|Google duration=30 ~2min  | наши ребята в чате спрашиваю там по нашим алматинским горам скучаешь или нет Я им сказал что тут таких гор много-много Сань я скучаю по друзьям пицца Сапсан до места для лазания очень много искала его действительно и всё такой же если не лучше доступности как у нас Даже лучше чем Северная Япония кстати 1200m он запрессовывают половинами за время зимы и потом он сохраняется в течение всего года называется Золушка Зимой я ходил впереди порно Диана показалось да Потом Сегодня мы Да сегодня на всякий случай и непонятно вчера хотелось и поинтереснее думаешь надо проследить что хорошо что здесь везде кафешки рестораны сейчас будем в канале деревня проезжать Там дверь открыта можем сейчас созвониться там wi-fi кофе попьём ну давай-давай не не напились ему еще кофе адрес дома ты дома 2 3 2 3 потом вторую я себе вторую там короче пожалуйста Давай остановимся попьём кофе какие-нибудь Спасибо тут руды добывают железо медь серебро сейчас будем приезжать с хорошей строевой достаточно развит почему вот эти кафешки функционирует дети платят за сервис получается допустим он там высокая 2.500 40 Чита она такая получается аналог наших усилий туюк-су только гораздо ценнее облагораживание кафе км в общем-то да Для меня это такое она самая крутая 2010 короче Легенда такая что Последний король Италии через этот перевал вот и через другие там перевалы выходил потом Швейцарию когда начались эти горы Пологи Ну так там травянистые склоны о неглиже снега Сейчас Ну сегодня я думал мои пнем пару раз |
|Sphinx ~20min | даже этот сядет и вошёл изи ко лбу и служкин нашёл в сбегал тягчайшее бедствие от и не тки готов на многое что я как и в этот час что друзья из вас не хватает за пять я боясь он все ещё герой лирайн или без ведома бриться в окнах вещички да и место для лазанием очень много искала иеговы и все такой же действий ездить к сбегу нас ждут нас даже есть бог будут будут де достигает тысячи метров над аферы и одним из самых низких батьку предвидеть бонзы двери и у борта пятой половина мира или о том он тебя отличий и могут быть звать должностей и надо было пять б два красных сдачу з б у б к де марево но её ходила б первая н коли не единственная б льше що б там в восьмидесятых годах зимой в деревне в или в воздухе блестят в народную музыку мала б дний б вот эти корм а я показала або было то что и так бы я и врач он франки бы естеств сэр какая бы сила дома рядом с що в н мав за пора нам щенка и б ля перечислять все ваши непонятно тебя хотя и войне тлеющих искр да обманом были из и благо искали то то отдыха в близь дблф б н б при съезде с ней надо а я вас я с со ли это вспышки ведь она будет в в не проезжать там доктор пища это может повториться а кошка идём в давая но уши развесили гарлема в уме с и а не на перечти ещё после к уха б с берегам этой реки жакетом ли жить с дверь во второй не я я в роде того д брион лэнди задвигает б б б короче эдна эдна символу вошёл то секреты увядает осталась бы ты ни в да и я в спасибо брат до того раз лесами а срисовывал воул тотчас дышать хотя и верфь коростой или даже эха в то что все это не в ему збл д бо н де не в пятьсот сорок так и было это на случай взут в жизни было доложено вздор из кожи вон я же не мол да не рада белья то в ней мы вздумал заедем в самые жгучие зону бабы зозул з б бл я бмп вверх но дакодо б льш н ч моряков и пена он вверх и на с с шестьсот десять битва а сам обсуждая в дамаске у него не было вообще вёдер водки на вс х и все в последняя король италии чадо горевал о тысячелетий они о отчего стали для неё значили так и не счесть эти горы пологие а ведь конная бо не коли з ближним если отвергали рыжих одержав но без его нам было зимнее небо бродить династии |
|Sphinx duration=30 ~20min | вам бы наши ребята сядет вошёл ли было бы в душном нашему в сбегал тягчайшее бедствие но публ ки гор на многое но то и пока н в д вча что друзья она и не хватает за хвост и боясь он всевидящий героев в сферы и дня без следов мифов об из дней да и место для аллаха не очень много искала его в шестьсот какой же из деньги из бумажка с бо в н д я висели над аферы и вопили часам предвидеть бонзо челюсти не в угоду пятой половинами с привязи и потом он с пищей он сего года денег звать должности як брака по то но с в й не страх не без барашка камушка зла красных зачув з б б фбр холостяку сидит парился но её родилась у эта шериф в из лесных б льше що б там шестьдесят пять года зимой в чернильной не х голос в б сейчас розовым в умах т был он в третий раз я показала або б до так же бы вторая часа ранкин быть что св т яркая бывшего дома жила с я вот она мучили меня и я все ваши непонятно тебя хотя и в щеше да обманом мало слуги были добрий з б искали то ту же десь дблф б н близко к сбиться в гиганта а я брат стекла что сведения выяснили и она будет под она не ли приятен там был при этом он зависит от того айку идём в но обдавая родного дома тоже есть гарриман не на деревья ещё горько б лан в эти всякие там в грязи дверь второй я б второй помада в тон де одинарный над б б б б рочестера и видно было уважал боролись в д сталася до и после её похитил бы в кто-то ура железами а серебро было больше отвечать за тебя были наростов и был ли вильтов ожидали в с конечно что это и есть пища это в ну было ба м г та самая где все пятьсот сорок а вот она слухи ззаду з не было доложено згор ло жил в н мол с пить чай а я не вижу но же думал заедем в самой гуще б в зону будет долгий верно но в общем-то да и в бы но как же это такое алонзо де в н з чим моряков в афинах он вверх и торжество дичи и битва а раз она крутая и в дамаске у него и возможно даже если его в родичи на вс х очереди от в и не король италии в отогревал уход и тебя и далее от один до зари когда жить губы так и было бы и с и горы пологи вот так надо видеть он бо не к ближним двери галерах да но мне было из этих пора бы станешь ни капельки |

|        | videoregistrator.wav |
|--------|----------------------|
|Оригинал|                      |
|Google duration=30 | почитал было Единый классификатор для поиска это было уговаривать уже при наличии слева трамвайных путей попутного направления расположенных на одном уровне с проезжей части поворот налево и разворот и должны выполняться из этих путей если знаками 5.8 не предписанный порядок движения при этом не должно создаваться препятствие трамваев поворот должен осуществляться таким образом чтобы пересечения проезжих частей транспортное средство не оказалось на стороне встречного движения при повороте направо транспортное средство должно двигаться ближе к правому краю проезжей части перед поворотом налево или разворота вне перекрестка водитель безрельсового транспортного средства обязан уступить дорогу встречным транспортным средствам и трамваю попутного направления дальше |
|Sphinx duration=30 | да вы и я же к рождеству равно к твому были заперты в бальном зале как это будет работать в двести тысяч в на нем взведённый взглядом в поэта приезжали в этом они бы смотреть на меня в рейхе воли говори признайтесь мне национальных попутного направления она товаров наверно она и на то вы не в порядке вернуться на трамвае товара таким образом були пересечения зарезать тебя да не оказалось товар обратно в замок разольется и лейтенанта наверно в окна в ноги и ликвидирована знали обязан егорова на трамвае в выздоровления в |

---

### Стоимость API

* Yandex SpeechKit - [калькулятор](https://cloud.yandex.ru/services/speechkit#calculator). Посекундная оплата, 60 секунд - 61 рос. рубль. Нужно регистрировать аккаунт на юридическое лицо.
* Google Cloud Speech to Text - [pricing](https://cloud.google.com/speech-to-text/pricing). 60 минут в месяц - бесплатно, дальше - 0.006 доллара за 15 секунд.
* Goolge Speech API - в документации нет упоминания. Для работы нужен только developer key. Он получается через консоль разработчика. Там же нужно активировать работу с этим API, но такой возможности уже нет ([информация здесь](http://www.chromium.org/developers/how-tos/api-keys)). В репозитории `SpeechRecognition` указан чей-то ключ, пока работает, но теоретически в любой момент его могут отключить (добавлен 5 лет назад).

### Тестирование Google Cloud Speech API

* Заходим в [консоль разработчика](https://console.cloud.google.com/).
* В поиске ищем "Speech-to-Text API", выбираем и активируем.
* В появившемся окне выбираем пункт меню "Credentials" и создаём "Service Account". При создании выбираем роль "Storage Admin" (эта роль позволяет получить доступ по uri к файлам в бакете).
* Добавляем JSON-ключ в аккаунт, скачиваем и подкладываем файл в директорию src.
* В консоле разработчика в поиске ищем "Storage".
* Создаем бакет и добавляем туда файлы с аудио в формате flac.
* Запускаем `docker build speech-recognition:0.0.1 .`.
* После сборки образа запускаем `docker run -it speech-recognition:0.0.1 bash`.
* Выполняем:
```
export GOOGLE_APPLICATION_CREDENTIALS=credentials.json
cd src
python test_google_cloud.py {path to flac-file in Google Storage}
```

|        | videoregistrator.flac |
|--------|-----------------------|
|Google Cloud Speech API| почитал Я уже второй день живу программа уже для диплома будем писать уже с кабановым обсуждаем как это будет как что 200.000 там уже выделила готова Единый классификатор для поиска вы будете приходить на склад привязывать Поэтому классификатора потом они будут смотреть закупки Ваши чувства к еще более подробно это было когда при наличии слева трамвайных путей попутного направления расположенных на одном уровне с проезжей части поворот налево и разворот и должны выполняться из этих путей если знаками 5.8 не предписанный порядок движения при этом не должно создаваться препятствие трамваю поворот должен осуществляться таким образом чтобы при выезде с пересечения проезжих частей транспортное средство не оказалось на стороне встречного движения при повороте направо транспортное средство должно двигаться по правому краю проезжей части перед поворотом налево или разворота вне перекрестка водитель безрельсового транспортного средства обязан уступить дорогу встречным |

|        | machine-denoise.flac |
|--------|----------------------|
|Google Cloud Speeach API| наши ребята в чате спрашивать много поедем посмотришь если 1000 метровые стены Северный до места для лазаньи очень много искал Егор действительно и всё такой же самый низкий в наших свадьбах время зимы и подумаем сохраняется называется Золушка какому Зимой я ходил Сейчас Народу мало спереди порно Диана показалось забавным порно бронхит бронхит разберёмся сегодня Мы из будущего проход из коричневой думаешь всё хорошо что здесь виде кафешке людей стороны сейчас будем проезжать Там две открытым wi-fi Ну давай мы еще Кофе будешь дома поэтика Дома 2 3 выстрела по виду кружку потом вторую я себе такую жару этом Пожалуйста давай тут руды добывают Уран железо Серебро но сейчас будем как раз приезжать с хорошей достаточно развит Почему люди платят за сервис получается допустим он показался высокая 2540 что-то она такая получается на горошине кафе используемых километров зайди Ну что мы едем она самая крутая наверное в этом массиве я через него ходил Последний король Италии через этот до той стороны эти горы пологие травянистый склон о лежит снег Я думал мы идём |

[Transcribing long audio files](https://cloud.google.com/speech-to-text/docs/async-recognize#speech_transcribe_async_gcs-python)

[Quickstart: Using client libraries](https://cloud.google.com/speech-to-text/docs/quickstart-client-libraries#client-libraries-usage-python)
