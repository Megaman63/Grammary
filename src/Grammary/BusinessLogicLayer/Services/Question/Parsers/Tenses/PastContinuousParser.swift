//
//  PastContinuousParser.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 2/17/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import Foundation

func parsePastContinuous() -> [Rule] {
    return [Rule(
        id: "PastContinuousRule",
        ruleDescription: "Past Continuous",
        questions: [
            Question(
                
                id: "Past Continuous-0",
                
                ruleTitle: "Past Continuous построение утвердительных предложений:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: "PastContinuous -0-0", text: "для образования утвердительных предложений в Past Continuous берутся формы прошедшего времени to be – was, were. Was используется в единственном числе, were – во множественном. У основного глагола убирается частица to и добавляется окончание -ing. "),
                    
                    Answer(id: "PastContinuous-0-1", text: " для образования утвердительных предложений в Past Continuous берутся формы прошедшего времени to be – was, were. Was используется в единственном числе, were – во множественном. У основного глагола убирается частица to. "),
                    
                    Answer(id: "PastContinuous-0-2", text: " для образования утвердительных предложений в Past Continuous берется форма прошедшего времени to be – was. У основного глагола убирается частица to и добавляется окончание -ing."),
                    
                    Answer(id: "PastContinuous-0-3", text: "для образования утвердительных предложений в Past Continuous, к глаголу добавляется окончание -ing.")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "I was singing. – Я пел.)"),
                    
                    RuleExample(text: "He was walking. – Он гулял.)"),
                    
                    RuleExample(text: "They were running. – Они бежали.)")
                    
                    ].toRealmList()
                
            ),
            
            Question(
                
                id: "Past Continuous-1",
                
                ruleTitle: "Past Continuous построение отрицательных предложений:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: "PastContinuous -1-0", text: "для образования отрицательных предложений в Past Continuous берутся вспомогательные глаголы was, were, добавляется отрицательная частица not и основной глагол с окончанием –ing без частицы to. "),
                    
                    Answer(id: "PastContinuous-1-1", text: " для образования отрицательных предложений в Past Continuous берутся вспомогательные глаголы was, were, добавляется отрицательная частица not и основной глагол с окончанием –ing с частицей to."),
                    
                    Answer(id: "PastContinuous-1-2", text: " для образования отрицательных предложений в Past Continuous берется форма прошедшего времени to be – was, добавляется отрицательная частица not и основной глагол с окончанием –ing без частицы to."),
                    
                    Answer(id: "PastContinuous-1-3", text: " для образования отрицательных предложений в Past Continuous берутся вспомогательные глаголы was, were, добавляется отрицательная частица not и основной глагол во второй форме. ")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "She was not writing. – Она не писала.)"),
                    
                    RuleExample(text: "It was not falling. – Оно не падало.)"),
                    
                    RuleExample(text: "We were not reading. – Мы не читали.)")
                    
                    ].toRealmList()
                
            ),
            
            Question(
                
                id: "Past Continuous-2",
                
                ruleTitle: "Past Continuous построение вопросительных предложений:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: "PastContinuous -2-0", text: "для образования вопросительных предложений в Past Continuous на первое место выносится вспомогательный глагол was (were), затем ставится подлежащее и основной глагол с окончанием -ing."),
                    
                    Answer(id: "PastContinuous-2-1", text: " для образования вопросительных предложений в Past Continuous на первое место выносится вспомогательный глагол was (were), затем основной глагол с окончанием –ing и подлежащее."),
                    
                    Answer(id: "PastContinuous-2-2", text: " для образования вопросительных предложений в Past Continuous на первое место выносится вспомогательный глагол was (were), затем подлежащее и основной глагол во второй форме."),
                    
                    Answer(id: "PastContinuous-2-3", text: " для образования вопросительных предложений в Past Continuous на первое место выносится вспомогательный глагол was (were), затем ставится подлежащее и основной глагол с окончанием –ing и частицей to. ")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "Was he walking? – Он гулял?)"),
                    
                    RuleExample(text: "Were you talking? – Вы разговаривали?)"),
                    
                    RuleExample(text: "Was I singing? – Я пел?)")
                    
                    ].toRealmList()
                
            ),
            
            Question(
                
                id: "Past Continuous-3",
                
                ruleTitle: "Past Continuous это:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: "PastContinuous-3-0", text: " время, показывающее действие, которое длилось в определенное время в прошлом. Неизвестно, когда оно началось, сколько времени занимало, закончилось или все еще продолжается. Обычно в предложении есть слова, указывающие на конкретное время или период времени, когда происходило действие."),
                    
                    Answer(id: "PastContinuous-3-1", text: " время, показывающее действие, которое длилось в неопределенное время в прошлом. Неизвестно, когда оно началось, сколько времени занимало, закончилось или все еще продолжается."),
                    
                    Answer(id: "PastContinuous-3-2", text: " время, показывающее действие, которое произошло в прошлом, но его результат связан с настоящим."),
                    
                    Answer(id: "PastContinuous-3-3", text: " время, показывающее действие, которое закончилось к определенному моменту в прошлом.")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "At midnight I was reading a book. – В полночь я читал книгу. (я начал читать до полуночи, возможно, продолжал после и в это конкретное время находился в процессе чтения)"),
                    
                    RuleExample(text: " - What were you doing at 8 a.m.? – Что ты делал в 8 утра? (действие происходило в определенный момент в прошлом)"),
                    
                    RuleExample(text: " – What were you doing during your vacation? – Что вы делали в отпуске? – We were travelling. – Мы путешествовали. (в период, когда у нас был отпуск)")
                    
                    ].toRealmList()
                
            ),
            
            Question(
                
                id: "Past Continuous-4",
                
                ruleTitle: "Past Continuous это:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: "PastContinuous-4-0", text: " время, которое используется, когда мы говорим о временной ситуации в прошлом, то есть о действии, которое длилось небольшой промежуток времени. Этот промежуток уточняется в предложении."),
                    
                    Answer(id: "PastContinuous-4-1", text: " время, которое используется, когда мы говорим о постоянной ситуации в прошлом, то есть о действии, которое длилось большой промежуток времени. "),
                    
                    Answer(id: "PastContinuous-4-2", text: " время, которое используется, когда мы говорим о временной ситуации в прошлом, то есть о действии, которое длилось небольшой промежуток времени. Этот промежуток не уточняется в предложении."),
                    
                    Answer(id: "PastContinuous-4-3", text: " время, которое используется, когда мы говорим о регулярно повторяющейся ситуации в прошлом.")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "Kate was studying history in summer. – Летом Кейт изучала историю. (действие происходило временно, а именно, летом)"),
                    
                    RuleExample(text: "They were living in China for 3 months. – Они жили в Китае 3 месяца. (действие длилось только три месяца)"),
                    
                    RuleExample(text: " She was working as an executive manager for two weeks while her boss was away on holiday. (она работала только в период, когда начальник был в отпуске)")
                    
                    ].toRealmList()
                
            ),
            
            Question(
                
                id: "Past Continuous-5",
                
                ruleTitle: "Past Continuous это:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: "PastContinuous-5-0", text: " время, передающее два действия, которые происходили одновременно в прошлом и соединенные союзами and (и, а), while (пока, в то время как)."),
                    
                    Answer(id: "PastContinuous-5-1", text: " время, передающее два действия, которые произошли одно за другим в прошлом. "),
                    
                    Answer(id: "PastContinuous-5-2", text: " время, которое передает временную ситуацию в прошлом. "),
                    
                    Answer(id: "PastContinuous-5-3", text: " время, которое используется, когда мы говорим о регулярно повторяющейся ситуации в прошлом.")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "My girlfriend and I were watching a film and my baby sister was playing with her new doll. – Мы с моей девушкой смотрели фильм, а моя сестренка играла со своей новой куклой. "),
                    
                    RuleExample(text: "I was writing a letter to my friend in Brazil while my wife was cooking dinner. – Я писал письмо другу в Бразилию, пока моя жена готовила ужин. "),
                    
                    RuleExample(text: "She was watching the online lecture while her son was playing video games. – Она смотрела лекцию онлайн, в то время как ее сын играл в видеоигры. ")
                    
                    ].toRealmList()
                
            ),
            
            Question(
                
                id: "Past Continuous-6",
                
                ruleTitle: "Past Continuous это:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: "PastContinuous-6-0", text: " время, которое используется для описания атмосферы, обстановки, сообщения сведений о том, что происходило."),
                    
                    Answer(id: "PastContinuous-6-1", text: " время, передающее два действия, которые произошли одно за другим в прошлом. "),
                    
                    Answer(id: "PastContinuous-6-2", text: " время, которое используется, когда мы говорим о временной ситуации в прошлом, то есть о действии, которое длилось небольшой промежуток времени. "),
                    
                    Answer(id: "PastContinuous-6-3", text: " время, которое используется, когда мы говорим о регулярно повторяющейся ситуации в прошлом.")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "I was driving to my granny’s house to the suburbs. It was raining. The road was slippery. I was looking carefully not to miss the turn to my granny’s house. – Я ехал к бабушке в пригород. Шел дождь. Дорога была скользкой. Я внимательно смотрел, чтобы не пропустить поворот к дому моей бабушки."),
                    
                    RuleExample(text: "She came to her friend on Thanksgiving. The guests were sitting on the sofa. They were laughing and chatting. The smell of the roasted turkey was filling the room. Everyone was waiting for the dinner. – Она пришла к подруге на День благодарения. Гости сидели на диване. Они беседовали и смеялись. Аромат жареной индейки наполнял комнату. Все ждали ужин."),
                    
                    RuleExample(text: " When I left home, the weather was getting better. The sun was shining through the thin clouds. The warm breeze was playing with new green leaves. – Когда я вышел из дома, погода менялась в лучшую сторону. Солнце светило через прозрачные облака. Теплый ветерок игрался со свежей зеленой листвой.")
                    
                    ].toRealmList()
                
            ),
            
            Question(
                
                id: "Past Continuous-7",
                
                ruleTitle: "Past Continuous это:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: "PastContinuous-7-0", text: " время, которое используется для описания неприятных и раздражающих привычек, которые были у человека в прошлом. В таких предложениях употребляются наречия always (всегда, постоянно), often (часто), constantly (постоянно)."),
                    
                    Answer(id: "PastContinuous-7-1", text: " время, которое используется, когда мы говорим о постоянной ситуации в прошлом, то есть о действии, которое длилось большой промежуток времени. "),
                    
                    Answer(id: "PastContinuous-7-2", text: " время, которое используется для выражения сожаления о действиях в прошлом, которые произошли или не произошли."),
                    
                    Answer(id: "PastContinuous-7-3", text: " время, которое используется для описания неприятных и раздражающих привычек, которые есть у человека в настоящем. В таких предложениях употребляются наречия always (всегда, постоянно), often (часто), constantly (постоянно).")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "She was always leaving teabags on the table! – Она всегда оставляла чайные пакетики на столе!"),
                    
                    RuleExample(text: "We were often being late because of you! – Из-за тебя мы часто опаздывали!"),
                    
                    RuleExample(text: " He was constantly misbehaving when his parents took him to the theatre. – Он постоянно плохо себя вел, когда родители брали его с собой в театр.")
                    
                    ].toRealmList()
                
            ),
            
            Question(
                
                id: "Past Continuous-8",
                
                ruleTitle: "Past Continuous это:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: "PastContinuous-8-0", text: " время, которое используется для описания событий, которые были запланированы, но не произошли. В этой функции употребляются глаголы to mean to (собираться, намереваться), to intend to (намереваться), to hope to (надеяться), to expect to (ожидать), to think (думать), to plan (планировать)."),
                    
                    Answer(id: "PastContinuous-8-1", text: " время, которое используется для описания событий, которые были запланированы и произошли. В этой функции употребляются глаголы to mean to (собираться, намереваться), to intend to (намереваться), to hope to (надеяться), to expect to (ожидать), to think (думать), to plan (планировать)"),
                    
                    Answer(id: "PastContinuous-8-2", text: " время, которое используется для описания спонтанных событий, которые произошли в прошлом. "),
                    
                    Answer(id: "PastContinuous-8-3", text: " время, которое используется для описания событий, которые были запланированы. В этой функции употребляется глагол used to.")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "She was hoping to have a luxurious wedding, but it turned out that her fiancé was greedy. – Она надеялась на роскошную свадьбу, но ее жених оказался скупым."),
                    
                    RuleExample(text: "They were thinking of buying a house, but then he lost his job and they had to put off their plans. – Они думали купить дом, но он потерял работу, и им пришлось отложить свои планы."),
                    
                    RuleExample(text: " She was expecting to be promoted, but the company hired a more qualified person for that position. – Она ожидала повышения по работе, но компания приняла на эту должность более квалифицированного работника. ")
                    
                    ].toRealmList()
                
            ),
            
            ].toRealmList())]
}

