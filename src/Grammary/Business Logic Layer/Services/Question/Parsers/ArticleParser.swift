//
//  ArticleParser.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 1/19/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import Foundation

func parseArticles() -> [Rule] {
    let indefinite = Rule(
        id: "a-i",
        ruleDescription: "Indefinite article",
        questions: [
            Question(
                id: "a-i-0",
                ruleTitle: "Неопределенный артикль используется",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "a-i-0-0", text: "когда речь идет о чем-то общем (какой-то, некоторый, один из группы таких же людей или предметов), а не о конкретном."),
                    Answer(id: "a-i-0-1", text: "когда говорим о чем-то, что есть только в одном экземпляре в мире, об уникальном явлении."),
                    Answer(id: "a-i-0-2", text: "когда мы говорим о том, что уже упоминалось в речи/тексте."),
                    Answer(id: "a-i-0-3", text: "с неисчисляемыми существительными, обозначающими вещества, жидкости, газы и абстрактные понятия")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "I’d like to buy a dress. – Я бы хотела купить платье. (какое-то, не определенное платье)"),
                    RuleExample(text: "He’s a doctor. – Он врач. (один из группы врачей)"),
                    RuleExample(text: "It’s a trolley-bus. – Это троллейбус. (какой-то троллейбус)")
                    ].toRealmList()
            ),
            Question(
                id: "a-i-2",
                ruleTitle: "Неопределенный артикль используется",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "a-i-1-0", text: "когда существительное выступает в роли представителя группы предметов, лиц, явлений, то есть своего рода обобщающим понятием для всей группы"),
                    Answer(id: "a-i-1-1", text: "когда говорим о чем-то, что есть только в одном экземпляре в мире, об уникальном явлении."),
                    Answer(id: "a-i-1-2", text: "c исчисляемыми существительными во множественном числе, если речь идет о группе людей, предметов или обо всех представителях некоторого класса в общем значении"),
                    Answer(id: "a-i-1-3", text: "с неисчисляемыми существительными, обозначающими вещества, жидкости, газы и абстрактные понятия")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "If you want to be a teacher, you should study a lot. – Если ты хочешь стать учителем, ты должен много учиться. (учитель как представитель данной профессии)"),
                    RuleExample(text: "Would you like an orange? – Апельсин хочешь? (любой)")
                    ].toRealmList()
            ),
            Question(
                id: "a-i-3",
                ruleTitle: "Неопределенный артикль используется",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "a-i-2-0", text: "когда впервые говорим о каком-нибудь предмете, лице, явлении"),
                    Answer(id: "a-i-2-1", text: "перед порядковыми числительными"),
                    Answer(id: "a-i-2-2", text: "со словами, означающими приемы пищи"),
                    Answer(id: "a-i-2-3", text: "со словами school, church, bed, hospital, college, university, court, prison, home, когда речь идет об их прямом назначении")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "Yesterday I saw a cat in the street. The cat was hungry. – Вчера я увидел кошку на улице. Эта кошка была голодной. (первый раз говорим о «какой-то» кошке, а второй раз уже об определенной «этой» кошке)"),
                    RuleExample(text: "This morning I bought a newspaper and a magazine. The newspaper is in my bag but I don’t know where the magazine is. – Сегодня утром я купил газету и журнал. Газета у меня в сумке, но я не знаю, куда подевался журнал. (в первом предложении купил «какие-то» журнал и газету, а во втором «эти» газета и журнал где-то лежат)")
                    ].toRealmList()
            ),
            Question(
                id: "a-i-4",
                ruleTitle: "Неопределенный артикль используется",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "a-i-3-0", text: "в таких фразах, как \"раз в месяц (каждый месяц)\", \"дважды в год (каждый год)\", \"три раза в неделю (каждую неделю)\""),
                    Answer(id: "a-i-3-1", text: "Перед такими существительными, как cinema (кинотеатр), theater (театр), а также словами, которые обозначают место, где происходит действие"),
                    Answer(id: "a-i-3-2", text: "Перед прилагательными в превосходной степени"),
                    Answer(id: "a-i-3-3", text: "перед названиями видов спорта, игр, напитков, блюд, языков, цветов и болезней.")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "I buy newspapers once a week. – Я покупаю газеты раз в неделю."),
                    RuleExample(text: "She drinks champagne twice a year. – Она пьет шампанское дважды в год.")
                    ].toRealmList()
            )
            ].toRealmList()
    )
    
    let definite = Rule(
        id: "a-d",
        ruleDescription: "Definite article",
        questions: [
            Question(
                id: "a-d-0",
                ruleTitle: "Определенный артикль используется",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "a-d-0-0", text: "когда говорим о чем-то, что есть только в одном экземпляре в мире, об уникальном явлении."),
                    Answer(id: "a-d-0-1", text: "когда речь идет о чем-то общем (какой-то, некоторый, один из группы таких же людей или предметов), а не о конкретном."),
                    Answer(id: "a-d-0-2", text: "С исчисляемыми существительными во множественном числе, если речь идет о группе людей, предметов или обо всех представителях некоторого класса в общем значении"),
                    Answer(id: "a-d-0-3", text: "с неисчисляемыми существительными, обозначающими вещества, жидкости, газы и абстрактные понятия")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "Where is the longest river in the world? – Где находится самая длинная река в мире? (она одна такая, самая длинная, поэтому используем the)")
                    ].toRealmList()
            ),
            Question(
                id: "a-d-1",
                ruleTitle: "Определенный артикль используется",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "a-d-1-0", text: "когда мы говорим о том, что уже упоминалось в речи/тексте"),
                    Answer(id: "a-d-1-1", text: "когда существительное выступает в роли представителя группы предметов, лиц, явлений, то есть своего рода обобщающим понятием для всей группы"),
                    Answer(id: "a-d-1-2", text: "c исчисляемыми существительными во множественном числе, если речь идет о группе людей, предметов или обо всех представителях некоторого класса в общем значении"),
                    Answer(id: "a-d-1-3", text: "с неисчисляемыми существительными, обозначающими вещества, жидкости, газы и абстрактные понятия")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "A car crashed into a wall. The car was quite badly damaged. – Машина врезалась в стену. Машина была сильно повреждена. (в первом случае «какая-то, одна из машин» врезалась в стену, а во втором предложении «именно эта» машина получила повреждения)"),
                    RuleExample(text: "There is a sports centre in the city. The centre is open from 10 till 21. – В городе есть спортивный центр. Центр открыт с 10 до 21. (в первом предложении мы просто сообщаем о каком-то центре в городе, во втором говорим, что именно этот центр открыт в определенное время)")
                    ].toRealmList()
            ),
            Question(
                id: "a-d-2",
                ruleTitle: "Определенный артикль используется",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "a-d-2-0", text: "перед порядковыми числительными: первый, двадцать пятый и т. д"),
                    Answer(id: "a-d-2-1", text: "когда впервые говорим о каком-нибудь предмете, лице, явлении"),
                    Answer(id: "a-d-2-2", text: "со словами, означающими приемы пищи"),
                    Answer(id: "a-d-2-3", text: "со словами school, church, bed, hospital, college, university, court, prison, home, когда речь идет об их прямом назначении")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "Who was the first teacher you had at school? – Кто был твоим первым учителем в школе?"),
                    RuleExample(text: "I was the second to know that she got married. – Я второй, кто узнал, что она вышла замуж.")
                    ].toRealmList()
            ),
            Question(
                id: "a-d-3",
                ruleTitle: "Определенный артикль используется",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "a-d-3-0", text: "перед прилагательными в превосходной степени: самый какой-то (самый умный, самый смелый и т. д.)."),
                    Answer(id: "a-d-3-1", text: "в таких фразах, как \"раз в месяц (каждый месяц)\", \"дважды в год (каждый год)\", \"три раза в неделю (каждую неделю)\""),
                    Answer(id: "a-d-3-2", text: "когда впервые говорим о каком-нибудь предмете, лице, явлении"),
                    Answer(id: "a-d-3-3", text: "перед названиями видов спорта, игр, напитков, блюд, языков, цветов и болезней.")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "This is the best compliment I have ever got. – Это лучший комплимент, который я когда-либо получала."),
                    RuleExample(text: "That was the worst performance that I have seen. – Это было худшее представление, которое я видел.")
                    ].toRealmList()
            ),
            Question(
                id: "a-d-4",
                ruleTitle: "Определенный артикль используется",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "a-d-4-0", text: "перед такими существительными, как cinema (кинотеатр), theater (театр), а также словами, которые обозначают место, где происходит действие"),
                    Answer(id: "a-d-4-1", text: "в таких фразах, как \"раз в месяц (каждый месяц)\", \"дважды в год (каждый год)\", \"три раза в неделю (каждую неделю)\""),
                    Answer(id: "a-d-4-2", text: "со словами, означающими приемы пищи."),
                    Answer(id: "a-d-4-3", text: "перед названиями видов спорта, игр, напитков, блюд, языков, цветов и болезней.")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "We often go to the cinema. – Мы часто ходим в кинотеатр."),
                    RuleExample(text: "She has books everywhere: on the table, on the floor, in the kitchen and even in the bathroom. – У нее книги повсюду: на столе, на полу, на кухне и даже в ванной.")
                    ].toRealmList()
            ),
            Question(
                id: "a-d-5",
                ruleTitle: "Определенный артикль используется",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "a-d-5-0", text: "с названиями стран во множественном числе или состоящие более чем из одного слова."),
                    Answer(id: "a-d-5-1", text: "в таких фразах, как \"раз в месяц (каждый месяц)\", \"дважды в год (каждый год)\", \"три раза в неделю (каждую неделю)\""),
                    Answer(id: "a-d-5-2", text: "со словами, означающими приемы пищи."),
                    Answer(id: "a-d-5-3", text: "перед названиями видов спорта, игр, напитков, блюд, языков, цветов и болезней.")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "the United States of America."),
                    RuleExample(text: "the Philippines.")
                    ].toRealmList()
            )
            ].toRealmList()
    )
    let zeroArticle = Rule(
        id: "a-za",
        ruleDescription: "Zero article",
        questions: [
            Question(
                id: "a-za-0",
                ruleTitle: "Нулевой артикль используется",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "a-za-0-0", text: "c неисчисляемыми существительными, обозначающими вещества, жидкости, газы и абстрактные понятия."),
                    Answer(id: "a-za-0-1", text: "когда речь идет о чем-то общем (какой-то, некоторый, один из группы таких же людей или предметов), а не о конкретном."),
                    Answer(id: "a-za-0-2", text: "в таких фразах, как \"раз в месяц (каждый месяц)\", \"дважды в год (каждый год)\", \"три раза в неделю (каждую неделю)\""),
                    Answer(id: "a-za-0-3", text: "со словами, означающими приемы пищи.")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "Water is necessary for life. – Вода необходима для жизни."),
                    RuleExample(text: "Compassion is one of his brightest features. – Сострадание – одна из самых ярких его черт.")
                    ].toRealmList()
            ),
            Question(
                id: "a-za-1",
                ruleTitle: "Нулевой артикль используется",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "a-za-1-0", text: "c исчисляемыми существительными во множественном числе, если речь идет о группе людей, предметов или обо всех представителях некоторого класса в общем значении."),
                    Answer(id: "a-za-1-1", text: "когда существительное выступает в роли представителя группы предметов, лиц, явлений, то есть своего рода обобщающим понятием для всей группы"),
                    Answer(id: "a-za-1-2", text: "когда мы говорим о том, что уже упоминалось в речи/тексте"),
                    Answer(id: "a-za-1-3", text: "когда говорим о чем-то, что есть только в одном экземпляре в мире, об уникальном явлении.")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "Trees produce oxygen. – Деревья вырабатывают кислород. (слово употреблено в общем смысле: не какие-то конкретные деревья, а все деревья)"),
                    RuleExample(text: "I like the trees outside my house. – Мне нравятся деревья возле моего дома. (имеются в виду конкретные деревья)")
                    ].toRealmList()
            ),
            Question(
                id: "a-za-2",
                ruleTitle: "Нулевой артикль используется",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "a-za-2-0", text: "со словами, означающими приемы пищи"),
                    Answer(id: "a-za-2-1", text: "перед порядковыми числительными: первый, двадцать пятый и т. д"),
                    Answer(id: "a-za-2-2", text: "когда впервые говорим о каком-нибудь предмете, лице, явлении"),
                    Answer(id: "a-za-2-3", text: "когда мы говорим о том, что уже упоминалось в речи/тексте")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "Breakfast is the most important meal of the day. – Завтрак – самый важный прием пищи в течение дня.")
                    ].toRealmList()
            ),
            Question(
                id: "a-za-3",
                ruleTitle: "Нулевой артикль используется",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "a-za-3-0", text: "со словами school, church, bed, hospital, college, university, court, prison, home, когда речь идет об их прямом назначении"),
                    Answer(id: "a-za-3-1", text: "перед прилагательными в превосходной степени: самый какой-то (самый умный, самый смелый и т. д.)."),
                    Answer(id: "a-za-3-2", text: "когда впервые говорим о каком-нибудь предмете, лице, явлении"),
                    Answer(id: "a-za-3-3", text: "перед названиями видов спорта, игр, напитков, блюд, языков, цветов и болезней.")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "Jack was in prison. – Джек был в тюрьме. (в качестве заключенного)"),
                    RuleExample(text: "Jack’s mother went to the prison to see him. – Мама Джека отправилась в тюрьму повидаться с ним. (она отправилась в здание тюрьмы как посетитель)")
                    ].toRealmList()
            ),
            Question(
                id: "a-za-4",
                ruleTitle: "Нулевой артикль используется",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "a-za-4-0", text: "перед названиями Городов и того, что в них находится: улиц, парков, скверов, железнодорожных станций, мостов, заведений, магазинов, банков и отелей, названных в честь своих основателей."),
                    Answer(id: "a-za-4-1", text: "перед такими существительными, как cinema (кинотеатр), theater (театр), а также словами, которые обозначают место, где происходит действие"),
                    Answer(id: "a-za-4-2", text: "в таких фразах, как \"раз в месяц (каждый месяц)\", \"дважды в год (каждый год)\", \"три раза в неделю (каждую неделю)\""),
                    Answer(id: "a-za-4-3", text: "когда существительное выступает в роли представителя группы предметов, лиц, явлений, то есть своего рода обобщающим понятием для всей группы."),
                    
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "Wall Street is famous all over the world. – Уолл-стрит знают во всем мире."),
                    RuleExample(text: "Times Square is situated in the central part of Manhattan. – Таймс-сквер находится в центральной части Манхэттена."),
                    RuleExample(text: "The prices in Johnson’s Pharmacy are cheap. – В аптеке Джонсона цены ниже.")
                    ].toRealmList()
            ),
            Question(
                id: "a-za-5",
                ruleTitle: "Нулевой артикль используется",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "a-za-5-0", text: "названиями стран, состоящих из одного слова."),
                    Answer(id: "a-za-5-1", text: "перед такими существительными, как cinema (кинотеатр), theater (театр), а также словами, которые обозначают место, где происходит действие"),
                    Answer(id: "a-za-5-2", text: "в таких фразах, как \"раз в месяц (каждый месяц)\", \"дважды в год (каждый год)\", \"три раза в неделю (каждую неделю)\""),
                    Answer(id: "a-za-5-3", text: "когда существительное выступает в роли представителя группы предметов, лиц, явлений, то есть своего рода обобщающим понятием для всей группы."),
                    
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "I’m from England. – Я из Англии.")
                    ].toRealmList()
            ),
            Question(
                id: "a-za-6",
                ruleTitle: "Нулевой артикль используется",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "a-za-6-0", text: "с названиями континентов и гор"),
                    Answer(id: "a-za-6-1", text: "перед такими существительными, как cinema (кинотеатр), theater (театр), а также словами, которые обозначают место, где происходит действие"),
                    Answer(id: "a-za-6-2", text: "с названиями стран во множественном числе или состоящие более чем из одного слова."),
                    Answer(id: "a-za-6-3", text: "когда существительное выступает в роли представителя группы предметов, лиц, явлений, то есть своего рода обобщающим понятием для всей группы."),
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "Africa is a large continent. – Африка – большой континент."),
                    RuleExample(text: "Mount Etna is a volcano. – Гора Этна – вулкан.")
                    ].toRealmList()
            ),
            Question(
                id: "a-za-7",
                ruleTitle: "Нулевой артикль используется",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "a-za-7-0", text: "с названиями озер и одиночных островов"),
                    Answer(id: "a-za-7-1", text: "перед такими существительными, как cinema (кинотеатр), theater (театр), а также словами, которые обозначают место, где происходит действие"),
                    Answer(id: "a-za-7-2", text: "с названиями стран во множественном числе или состоящие более чем из одного слова."),
                    Answer(id: "a-za-7-3", text: "когда существительное выступает в роли представителя группы предметов, лиц, явлений, то есть своего рода обобщающим понятием для всей группы."),
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "Lake Baikal is situated in Russia. – Озеро Байкал находится в России."),
                    RuleExample(text: "Madagascar is known for its nature. – Мадагаскар славится своей природой.")
                    ].toRealmList()
            )
            ].toRealmList()
    )
    
    return [indefinite, definite, zeroArticle]
}
