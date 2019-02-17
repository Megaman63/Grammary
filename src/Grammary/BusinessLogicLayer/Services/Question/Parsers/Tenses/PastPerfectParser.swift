//
//  PastPerfectParser.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 2/17/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import Foundation

func parsePastPerfect() -> [Rule] {
    return [Rule(
        id: "PastPerfectRule",
        ruleDescription: "Past Perfect",
        questions: [
            Question(
                
                id: "Past Perfect-0",
                
                ruleTitle: "Past Perfect построение утвердительных предложений:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: " PastPerfect-0-0", text: " утвердительные предложения в Past Perfect строятся при помощи вспомогательного глагола had и основного глагола в третьей форме.)."),
                    
                    Answer(id: "PastPerfect-0-1", text: " утвердительные предложения в Past Perfect строятся при помощи вспомогательного глагола had и основного глагола во второй форме. "),
                    
                    Answer(id: "PastPerfect-0-2", text: " утвердительные предложения в Past Perfect строятся при помощи вспомогательного глагола had и основного глагола с окончанием -ing."),
                    
                    Answer(id: "PastPerfect-0-3", text: " утвердительные предложения в Past Perfect строятся при помощи вспомогательного had been и основного глагола в третьей форме).")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "I had done the paper work by Friday. - Я проработал все документы к пятнице.)"),
                    
                    RuleExample(text: "He had seen me before he left for Paris. - Он повидался со мной до того, как уехал в Париж.)"),
                    
                    RuleExample(text: "The plane had left by the time I got to the airport. – К тому времени, как я добрался до аэропорта, самолет улетел.)")
                    
                    ].toRealmList()
                
            ),
            
            Question(
                
                id: "Past Perfect-1",
                
                ruleTitle: "Past Perfect построение отрицательных предложений:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: "PastPerfect-1-0", text: " отрицательные предложения в Past Perfect строятся при помощи вспомогательного глагола had, отрицательной частицы not и основного глагола в третьей форме."),
                    
                    Answer(id: "PastPerfect-1-1", text: " отрицательные предложения в Past Perfect строятся при помощи вспомогательного глагола had, отрицательной частицы not и основного глагола во второй форме."),
                    
                    Answer(id: "PastPerfect-1-2", text: " отрицательные предложения в Past Perfect строятся при помощи вспомогательного глагола had, отрицательной частицы not и основного глагола с окончанием -ing. "),
                    
                    Answer(id: "PastPerfect-1-3", text: " отрицательные предложения в Past Perfect строятся при помощи вспомогательного глагола had been, отрицательной частицы not и основного глагола в третьей форме.")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: " She had not established her company until 2008. – До 2008 года у нее не было своей компании.)"),
                    
                    RuleExample(text: "I had not been to Mexico once before. – Я раньше ни разу не был в Мексике.)"),
                    
                    RuleExample(text: "The neighbour said he had not seen our dog. – Сосед сказал, что он не видел нашу собаку.)")
                    
                    ].toRealmList()
                
            ),
            
            Question(
                
                id: "Past Perfect-2",
                
                ruleTitle: "Past Perfect построение вопросительных предложений:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: " PastPerfect-2-0", text: " для образования вопросительных предложений в Past Perfect на первое место выносится вспомогательный глагол had, затем подлежащее и основной глагол в третьей форме."),
                    
                    Answer(id: "PastPerfect-2-1", text: " для образования вопросительных предложений в Past Perfect на первое место выносится вспомогательный глагол had, затем подлежащее и основной глагол во второй форме."),
                    
                    Answer(id: "PastPerfect-2-2", text: " для образования вопросительных предложений в Past Perfect на первое место выносится вспомогательный глагол had, затем подлежащее и основной глагол с окончанием -ing."),
                    
                    Answer(id: "PastPerfect-2-3", text: " для образования вопросительных предложений в Past Perfect на первое место выносится вспомогательный глагол had, затем основной глагол в третьей форме и подлежащее.")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "Had they read the instructions before they switched on the mobile phone? – Они прочитали инструкцию перед тем, как включили телефон?)"),
                    
                    RuleExample(text: "Had they rung the office before they drove away? – Они позвонили в офис, прежде чем уехали?)"),
                    
                    RuleExample(text: "What had she done before she turned on the TV? – Что она сделала перед тем, как включить телевизор?)")
                    
                    ].toRealmList()
                
            ),
            
            Question(
                
                id: "Past Perfect-3",
                
                ruleTitle: "Past Perfect это:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: "PastPerfect-3-0", text: " действие, которое произошло раньше другого действия или определенного момента в прошлом, выраженного союзными словами by... (к какому-то времени/моменту), after(после того как), before (до того как), when (когда), earlier (раньше), first (сперва, сначала)."),
                    
                    Answer(id: "PastPerfect-3-1", text: " действие, которое произошло в определенный момент в прошлом, выраженного наречиями времени yesterday, last week, ago"),
                    
                    Answer(id: "PastPerfect-3-2", text: " действие, которое уже совершилось и мы видим его результат в настоящем."),
                    
                    Answer(id: "PastPerfect-3-3", text: " длительное действие, происходившее в определенный момент в прошлом. ")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "We arrived at the station at 7.30, but the train had left. - Мы прибыли на вокзал в 7:30, но поезд уже ушел. (сначала поезд ушел, потом мы прибыли на вокзал))"),
                    
                    RuleExample(text: "He was hungry. He hadn’t eaten for eight hours. - Он был голоден. Он не ел восемь часов.)"),
                    
                    RuleExample(text: "They were moving to another country, but they hadn’t told their parents yet. - Они переезжали в другую страну, но еще не сказали об этом своим родителям.)")
                    
                    ].toRealmList()
                
            ),
            
            Question(
                
                id: "Past Perfect-4",
                
                ruleTitle: "Past Perfect это:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: " PastPerfect-4-0", text: " действие, которое началось в прошлом и продолжалось до определенного момента в прошлом. Употребляется с предлогами for (в течение) и since (с тех пор как, начиная с) и глаголами состояния, которые не используются с временами группы Continuous."),
                    
                    Answer(id: "PastPerfect-4-1", text: "действие, которое началось в прошлом и продолжалось до определенного момента в прошлом. Употребляется с предлогами for (в течение) и since (с тех пор как, начиная с) и глаголами движения. "),
                    
                    Answer(id: "PastPerfect-4-2", text: " действие, которое началось в прошлом и продолжалось до определенного момента в настоящем. Употребляется с предлогами for (в течение) и since (с тех пор как, начиная с) и глаголами состояния. "),
                    
                    Answer(id: "PastPerfect-4-3", text: " длительное действие, происходившее в определенный момент в прошлом.")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "He didn’t want to drive that car anymore. He had driven it for 30 years. - Он не хотел больше водить эту машину. Он водил ее уже 30 лет.)"),
                    
                    RuleExample(text: "Her speech was impressive. She had worked on it since Monday. - Ее речь была впечатляющей. Она работала над ней с понедельника.)"),
                    
                    RuleExample(text: "Before we talked, Mary had kept silence for three days. - До того как мы поговорили, Мэри хранила молчание три дня.)"),
                    
                    ].toRealmList()
                
            ),
            
            Question(
                
                id: "Past Perfect-5",
                
                ruleTitle: "Past Perfect это:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: " PastPerfect-5-0", text: " время, при помощи которого мы сообщаем о личном опыте в прошлом."),
                    
                    Answer(id: "PastPerfect-5-1", text: " время, при помощи которого мы сообщаем о привычках в прошлом. "),
                    
                    Answer(id: "PastPerfect-5-2", text: " время, при помощи которого мы сообщаем о действиях, произошедших в прошлом и никак не связанных с настоящим. "),
                    
                    Answer(id: "PastPerfect-5-3", text: "время, при помощи которого мы сообщаем о том, что мы планировали сделать в прошлом. ")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "The last week of my holidays was the worst week I had ever had. - Последняя неделя моего отпуска была самой худшей неделей, которая у меня когда-либо была.)"),
                    
                    RuleExample(text: " I had never seen such a beautiful sunset before I went to the island. – Я никогда не видела такой красивый закат до того, как поехала на этот остров.)"),
                    
                    RuleExample(text: " She had never been to the symphony before last night. – До вчерашнего вечера она ни разу не была на симфоническом концерте.)"),
                    
                    ].toRealmList()
                
            ),
            
            Question(
                
                id: "Past Perfect-6",
                
                ruleTitle: "Past Perfect это:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: " PastPerfect-6-0", text: "действие в условных придаточных предложениях после if (third conditional), выражающих сожаление о прошлом, о том, чего изменить нельзя. "),
                    
                    Answer(id: "PastPerfect-6-1", text: " действие в условных придаточных предложениях после if (second conditional), выражающих нереальное действие в настоящем. "),
                    
                    Answer(id: "PastPerfect-6-2", text: " действие в главном предложении в третьем условном наклонении, выражающих сожаление о прошлом, о том, чего изменить нельзя. "),
                    
                    Answer(id: "PastPerfect-6-3", text: "действие в условных придаточных предложениях после if (second conditional), выражающих сожаление о прошлом, о том, чего изменить нельзя. ")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "If I had known about your problem, I would have helped you. - Если бы я знал о твоей проблеме, я бы тебе помог. (но я не знал)"),
                    
                    RuleExample(text: "If you had read the morning newspaper, you would have agreed with me. - Если бы ты прочитал утреннюю газету, ты бы со мной согласился. (но ты не читал)"),
                    
                    RuleExample(text: " If I had seen him, I would have told him the news. (но я его не увидел)"),
                    
                    ].toRealmList()
                
            ),
            
            Question(
                
                id: "Past Perfect-7",
                
                ruleTitle: "Past Perfect это:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: " PastPerfect-7-0", text: "действие в конструкциях hardly ... when / no sooner ... than, указывающие на то, что одно действие произошло сразу за другим. В них используется порядок слов, как в вопросе. На русский язык такие предложения переводятся с помощью слов «как только», «не успел я», «едва я»."),
                    
                    Answer(id: "PastPerfect-7-1", text: " действие в конструкциях hardly ... when / no sooner ... than, указывающие на то, что одно действие произошло сразу за другим. На русский язык такие предложения переводятся с помощью слов «как только», «не успел я», «едва я». "),
                    
                    Answer(id: "PastPerfect-7-2", text: " действие в конструкциях hardly ... when / no sooner ... than, указывающие на то, что одно действие произошло задолго до другого действия. В них используется порядок слов, как в вопросе."),
                    
                    Answer(id: "PastPerfect-7-3", text: " действие в конструкциях hardly ... when / no sooner ... than, указывающие на то, что одно действие никак не связано с другим.")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "Hardly had the plane landed at the Miami airport, when it started to rain. - Едва самолет приземлился в аэропорте Майами, как начался дождь.)"),
                    
                    RuleExample(text: "No sooner had I chewed my sandwich than somebody knocked at the door. - Не успел я прожевать свой сэндвич, как кто-то постучал в дверь.)"),
                    
                    RuleExample(text: " No sooner had she finished one project than she started working on the next. – Не успела она закончить один проект, как принялась за другой.)"),
                    
                    ].toRealmList()
                
            ),
            ].toRealmList()
        )]
}
