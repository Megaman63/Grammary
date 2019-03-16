//
//  FuturePerfectParser.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 3/16/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import Foundation

func parseFuturePerfect() -> [Rule] {
    return [Rule(
        id: "FuturePerfectRule",
        ruleDescription: "Future Perfect",
        questions: [
            Question(
                id: "Future Perfect-0",
                ruleTitle: "Future Perfect построение утвердительных предложений:",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                //complexity: "A1",
                answers: [
                    Answer(id: " FuturePerfect-0-0", text: "Утвердительное предложение в Future Perfect строится с помощью will have и третьей формы основного глагола."),
                    Answer(id: "FuturePerfect-0-1", text: " Утвердительное предложение в Future Perfect строится с помощью will и третьей формы основного глагола."),
                    Answer(id: "FuturePerfect-0-2", text: " Утвердительное предложение в Future Perfect строится с помощью will have и начальной формы основного глагола."),
                    Answer(id: "FuturePerfect-0-3", text: " Утвердительное предложение в Future Perfect строится с помощью will have и глагола с окончанием -ing.")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "The kids will have gone to bed by the time dad comes. - Дети лягут спать к тому времени, как придёт отец.)"),
                    RuleExample(text: "I think she’ll have finished cooking the pie by dinner time.  Я думаю, к обеду она закончит готовить пирог.)"),
                    RuleExample(text: "I will have graduated from the university by 2016 – Я закончу университет к 2016 году.)")
                    ].toRealmList()
            ),
            
            Question(
                id: "Future Perfect-1",
                ruleTitle: "Future Perfect построение отрицательных предложений:",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                //complexity: "A1",
                answers: [
                    Answer(id: "FuturePerfect-1-0", text: " Отрицательное предложение в Future Perfect строится с помощью will, отрицательной частицы not,  have и третьей формы основного глагола."),
                    Answer(id: "FuturePerfect-1-1", text: " Отрицательное предложение в Future Perfect строится с помощью will, отрицательной частицы not,  have и первой формы основного глагола."),
                    Answer(id: "FuturePerfect-1-2", text: " Отрицательное предложение в Future Perfect строится с помощью will have, отрицательной частицы not и третьей формы основного глагола."),
                    Answer(id: "FuturePerfect-1-3", text: " Отрицательное предложение в Future Perfect строится с помощью will, отрицательной частицы not,  have и глагола с окончанием -ing.")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: " The plane will not have taken off by 3 o’clock – Самолет не взлетит к 3 часам.)"),
                    RuleExample(text: "He won’t have bought anything by Saturday – Он ничего не купит к субботе.)"),
                    RuleExample(text: "Lina won’t have managed to do that by the evening.  Лина не успеет это сделать к вечеру.)")
                    ].toRealmList()
            ),
            Question(
                id: "Future Perfect-2",
                ruleTitle: "Future Perfect построение вопросительных предложений:",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                //complexity: "A1",
                answers: [
                    Answer(id: "FuturePerfect-2-0", text: " Вопросительное предложение в Future Perfect строится с помощью will, затем подлежащего, have и третьей формы основного глагола."),
                    Answer(id: "FuturePerfect-2-1", text: " Вопросительное предложение в Future Perfect строится с помощью will, затем подлежащего, have и второй формы основного глагола."),
                    Answer(id: "FuturePerfect-2-2", text: " Вопросительное предложение в Future Perfect строится с помощью will, затем подлежащего, have и первой формы основного глагола."),
                    Answer(id: "FuturePerfect-2-3", text: " Вопросительное предложение в Future Perfect строится с помощью will, затем подлежащего, have и глагола с окончанием -ing.")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "Will he have left by that time? – Он уйдет к тому времени?)"),
                    RuleExample(text: "Won’t he have called all our clients by Tuesday? – Разве он не обзвонит всех наших клиентов ко вторнику?)"),
                    RuleExample(text: "Will you have cleaned the dishes away by the time John comes back?  Ты уберёшь тарелки к тому времени, как Джон вернётся?)")
                    ].toRealmList()
            ),
            Question(
                id: "Future Perfect-3",
                ruleTitle: "Future Perfect это:",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                //complexity: "B1",
                answers: [
                    Answer(id: "FuturePerfect-3-0", text: " действие, которое завершится к определенному моменту в будущем. Определенный момент передается предлогами by... (к какому-то времени/моменту), by the time (к тому времени как), by then (к тому времени), before (перед тем как), when (когда), until/till(до того как). "),
                    Answer(id: "FuturePerfect-3-1", text: " действие, которое будет происходить в определенный момент в будущем. Определенный момент передается предлогом at this time tomorrow. "),
                    Answer(id: "FuturePerfect-3-2", text: " факт или общеизвестное знание, которые будут иметь место в будущем.  "),
                    Answer(id: "FuturePerfect-3-3", text: " запланированное действие, которое произойдет в ближайшем будущем. ")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "I want to quit my job in a month. I will have worked for 5 years for this company by then.  Я хочу через месяц уволиться. К тому времени я проработаю в этой компании 5 лет.)"),
                    RuleExample(text: "We will have built our new house by the next year.  Мы достроим наш новый дом к следующему году.)"),
                    RuleExample(text: "He won’t have finished arguing until you agree with him.  Он не прекратит спорить, пока ты с ним не согласишься.)")
                    ].toRealmList()
            ),
            Question(
                id: "Future Perfect-4",
                ruleTitle: "Future Perfect это:",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                //complexity: "C1",
                answers: [
                    Answer(id: " FuturePerfect-4-0", text: " аналог конструкции must have done, выражающий предположение, что действие было выполнено. На русский язык переводиться прошедшим временем со словами «возможно», «вероятно», «должно быть»."),
                    Answer(id: "FuturePerfect-4-1", text: " аналог конструкции should have done, выражающий критику о совершенном или несовершенном действии. "),
                    Answer(id: "FuturePerfect-4-2", text: " аналог конструкции must have done, выражающий необходимость совершения действия в будущем. "),
                    Answer(id: "FuturePerfect-4-3", text: "аналог конструкции must have done, выражающий неуверенное предположение, что действие было выполнено. На русский язык переводиться прошедшим временем со словами «возможно», «вероятно», «должно быть». ")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "You will have heard the news about my nephew’s marriage.  Ты, должно быть, слышала новости о женитьбе моего племянника.)"),
                    RuleExample(text: "He will have noticed that she is highly nervous.  Он, вероятно, заметил, что она сильно нервничает.)"),
                    RuleExample(text: " They will have booked the tickets for their vacation next week. – Они, вероятно, заказали билеты для отпуска на следующей неделе. "),
                    ].toRealmList()
            ),
            ].toRealmList()
        )]
}
