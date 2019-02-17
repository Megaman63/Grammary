//
//  PastSimpleParser.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 2/17/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import Foundation

func parsePastSimple() -> [Rule] {
    return [Rule(
        id: "PastSimpleRule",
        ruleDescription: "Past Simple",
        questions: [
            Question(
                
                id: "Past Simple-0",
                
                ruleTitle: "Past Simple построение утвердительных предложений:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: "PastSimple-0-0", text: "для образования утвердительных предложений в Past Simple, к глаголу добавляется окончание -ed, если глагол правильный. Если глагол неправильный, то берется вторая форма глагола из второй колонки таблицы неправильных глаголов. "),
                    
                    Answer(id: "PastSimple-0-1", text: "для образования утвердительных предложений в Past Simple, к глаголу добавляется окончание -ing. "),
                    
                    Answer(id: "PastSimple-0-2", text: "для образования утвердительных предложений в Past Simple, к глаголу добавляется окончание -ed, если глагол правильный. Если глагол неправильный, то берется третья форма глагола из третьей колонки таблицы неправильных глаголов."),
                    
                    Answer(id: "PastSimples-0-3", text: "для образования утвердительных предложений в Past Simple, к глаголу добавляется окончание -ed.")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "I played. – Я играл.)"),
                    
                    RuleExample(text: "He told. – Он говорил.)"),
                    
                    RuleExample(text: "She stopped. – Она остановилась.)")
                    
                    ].toRealmList()
                
            ),
            
            Question(
                
                id: "PastSimple-1",
                
                ruleTitle: "Past Simple построение отрицательных предложений:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: "PastSimple-1-0", text: " для образования отрицательного предложения в Past Simple берется вспомогательный глагол did, отрицательная частица not и основной глагол в форме инфинитива без частицы to)."),
                    
                    Answer(id: "PastSimple-1-1", text: " для образования отрицательного предложения в Past Simple берется вспомогательный глагол did, отрицательная частица not и основной глагол во второй форме"),
                    
                    Answer(id: "PastSimple-1-2", text: " для образования отрицательного предложения в Past Simple берется вспомогательный глагол did, отрицательная частица not и основной глагол в форме инфинитива с частицей to "),
                    
                    Answer(id: "PastSimples-1-3", text: " для образования отрицательного предложения в Past Simple берется вспомогательный глагол had, отрицательная частица not и основной глагол в форме инфинитива без частицы to ")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "I did not play. – Я не играл.)"),
                    
                    RuleExample(text: "He did not tell. – Он не говорил.)"),
                    
                    RuleExample(text: "You did not do. – Вы не сделали.)")
                    
                    ].toRealmList()
                
            ),
            
            Question(
                
                id: "Past Simple-2",
                
                ruleTitle: "Past Simple построение вопросительных предложений:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: "PastSimple-2-0", text: " для образования вопросительного предложения в Past Simple вспомогательный глагол did ставится на первое место (перед подлежащим), затем подлежащее и основной глагол в форме инфинитива без частицы to)."),
                    
                    Answer(id: "PastSimple-2-1", text: " для образования вопросительного предложения в Past Simple вспомогательный глагол did ставится на первое место (перед подлежащим), затем подлежащее и основной глагол во второй форме"),
                    
                    Answer(id: "PastSimple-2-2", text: " для образования вопросительного предложения в Past Simple вспомогательный глагол did ставится на первое место (перед подлежащим), затем подлежащее и основной глагол в форме инфинитива с частицей to "),
                    
                    Answer(id: "PastSimples-2-3", text: " для образования вопросительного предложения в Past Simple вспомогательный глагол was ставится на первое место (перед подлежащим), затем подлежащее и основной глагол в форме инфинитива без частицы to ")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "Did I play? – Я играл?)"),
                    
                    RuleExample(text: "Did he tell? – Он говорил?)"),
                    
                    RuleExample(text: "Did you do? – Вы сделали?)")
                    
                    ].toRealmList()
                
            ),
            
            Question(
                
                id: "Past Simple-3",
                
                ruleTitle: "Past Simple это:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: "PastSimple-3-0", text: " время, которое показывает факт в прошлом или единичное действие, которое закончилось в прошлом."),
                    
                    Answer(id: "PastSimple-3-1", text: " время, которое показывает длительность действия в прошлом."),
                    
                    Answer(id: "PastSimple-3-2", text: " время, которое используется для выражения действия, которое произошло в прошлом, но его результат связан с настоящим."),
                    
                    Answer(id: "PastSimples-3-3", text: " действие, которое закончилось к определенному моменту в прошлом.")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "I saw him yesterday. – Я видел его вчера. (единичное действие в прошлом, вчера уже закончилось)"),
                    
                    RuleExample(text: "The Titanic sank in 1912. – Титаник затонул в 1912 году. (факт)"),
                    
                    RuleExample(text: " She spoke to him in a low voice. – Она тихо говорила с ним. (единичное действие в прошлом)")
                    
                    ].toRealmList()
                
            ),
            
            Question(
                
                id: "Past Simple-4",
                
                ruleTitle: "Past Simple это:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: "PastSimple-4-0", text: " время, которое рассказывает о старых привычках и повторяющихся действиях. Эти действия неоднократно происходили в прошлом, но сейчас уже не совершаются."),
                    
                    Answer(id: "PastSimple-4-1", text: " время, которое показывает действие, которое произошло раньше другого действия в прошлом."),
                    
                    Answer(id: "PastSimple-4-2", text: " время, которое используется для выражения действия, которое произошло в прошлом, но его результат связан с настоящим."),
                    
                    Answer(id: "PastSimples-4-3", text: " действие, которое закончилось к определенному моменту в прошлом.")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "We took evening courses two years ago. – Мы ходили на вечерние курсы 2 года назад. (сейчас мы не ходим на вечерние курсы)"),
                    
                    RuleExample(text: "He always bought newspapers on Sunday. – Он всегда покупал газеты по воскресеньям. (сейчас он не делает этого)"),
                    
                    RuleExample(text: "She attended the dance school for three years. – Она ходила в танцевальную школу три года. (сейчас она не посещает эту школу)")
                    
                    ].toRealmList()
                
            ),
            
            Question(
                
                id: "Past Simple-5",
                
                ruleTitle: "Past Simple это:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: "PastSimple-5-0", text: " время, которое используется, когда мы рассказываем историю или перечисляем несколько событий, которые происходили одно за другим в прошлом."),
                    
                    Answer(id: "PastSimple-5-1", text: " время, которое показывает действие, которое произошло раньше другого действия в прошлом."),
                    
                    Answer(id: "PastSimple-5-2", text: " время, которое используется для выражения действия, которое произошло в прошлом, но его результат связан с настоящим."),
                    
                    Answer(id: "PastSimples-5-3", text: " действие, которое закончилось к определенному моменту в прошлом.")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "She came in, sat at the table, and started writing. – Она вошла, села за стол и начала писать. (несколько действий, которые происходили один за другим в прошлом)"),
                    
                    RuleExample(text: " He entered the café, he ordered a cup of tea and a piece of cake. – Он вошел в кафе, заказал чашку чая и кусок пирога. (перечисление событий в истории)"),
                    
                    ].toRealmList()
                
            ),
            
            Question(
                
                id: "Past Simple-6",
                
                ruleTitle: "Past Simple это:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: "PastSimple-6-0", text: "время, чтобы рассказать детали какой-то новости или события, произошедшего в жизни человека. Сама новость сообщается в Present Perfect. "),
                    
                    Answer(id: "PastSimple-6-1", text: " время, чтобы рассказать какие-то новости или события, произошедшие в жизни человека."),
                    
                    Answer(id: "PastSimple-6-2", text: " время, которое используется для выражения действия, которое произошло в прошлом, но его результат связан с настоящим."),
                    
                    Answer(id: "PastSimples-6-3", text: " действие, которое закончилось к определенному моменту в прошлом.")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "I've hurt my leg. I fell off a ladder when I was repairing the roof. My telephone rang unexpectedly. - Я поранил ногу. Я упал с лестницы, когда чинил крышу, потому что внезапно зазвонил телефон. )"),
                    
                    RuleExample(text: "I’ve got this job. It was a hard and exhausting interview, but it turned out that I was a perfect applicant. - Я получил эту работу. Это было тяжелое, изнуряющее собеседование, но оказалось, что я идеальный кандидат.)"),
                    
                    RuleExample(text: " She has been fired. She was always late for work. Besides, she failed to meet deadlines. – Ее уволили. Она постоянно опаздывала на работу. Кроме того, не выполняла работу в установленные сроки. )")
                    
                    ].toRealmList()
                
            ),
            
            Question(
                
                id: "Past Simple-7",
                
                ruleTitle: "Past Simple это:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: "PastSimple-7-0", text: "законченное действие в прошлом в придаточных времени после союзов after (после того как), before (до того как), when (когда), until (пока не), as soon as (как только). "),
                    
                    Answer(id: "PastSimple-7-1", text: " действие, которое происходит в настоящем в придаточных времени после союзов after (после того как), before (до того как), when (когда), until (пока не), as soon as (как только). "),
                    
                    Answer(id: "PastSimple-7-2", text: " действие, которое будет происходить в будущем в придаточных времени после союзов after (после того как), before (до того как), when (когда), until (пока не), as soon as (как только)."),
                    
                    Answer(id: "PastSimples-7-3", text: " нереальное действие в прошлом в придаточных времени после союзов after (после того как), before (до того как), when (когда), until (пока не), as soon as (как только).")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "As soon as she graduated from the university, she found a suitable job. - Как только она окончила университет, она нашла подходящую работу. )"),
                    
                    RuleExample(text: "He was astonished when I told him the news. - Он был поражен, когда я сообщил ему эту новость.)"),
                    
                    RuleExample(text: " After she had dinner, she went shopping. – После того, как она пообедала, она отправилась за покупками.")
                    
                    ].toRealmList()
                
            ),
            
            Question(
                
                id: "Past Simple-8",
                
                ruleTitle: "Past Simple это:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: "PastSimple-8-0", text: "действие в условных предложениях после союза if (если) для описания нереального действия в настоящем (вероятность того, что условие будет выполнено, крайне мала (Second Conditional). Структура: If + Past Simple (условие), would + глагол без to (результат)"),
                    
                    Answer(id: "PastSimple-8-1", text: " действие в условных предложениях после союза if (если) для описания реального действия в настоящем (First Conditional). Структура: If + Past Simple (условие), would + глагол без to (результат)."),
                    
                    Answer(id: "PastSimple-8-2", text: " действие в условных предложениях после союза if (если) для описания нереального действия в настоящем (вероятность того, что условие будет выполнено, крайне мала (Second Conditional). Структура: If + Past Simple (условие), would + Past Simple."),
                    
                    Answer(id: "PastSimples-8-3", text: " действие в условных предложениях после союза if (если) для описания нереального действия в прошлом (вероятность того, что условие было выполнено, крайне мала (Second Conditional). Структура: If + Past Simple (условие), Past Perfect")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "If he had enough money, he would buy that car. - Если бы у него было достаточно денег, он бы купил эту машину. (сейчас у него нет денег, если бы они были, он приобрел бы машину) )"),
                    
                    RuleExample(text: "If I wanted to lose weight, I would eat less bread. - Если бы я хотел похудеть, я бы ел меньше хлеба. (но я не хочу худеть) )"),
                    
                    RuleExample(text: "If I were in your shoes, I wouldn’t rush into a decision. - Если бы я был на твоем месте, я бы не торопился с решением. (но я не на твоем месте) )"),
                    
                    RuleExample(text: "If she were on her vacation, she would spend it in Australia. - Если бы она была в отпуске, она провела бы его в Австралии. (но сейчас она не в отпуске) )")
                    
                ].toRealmList()
                
            ),
            
            Question(
                
                id: "Past Simple-9",
                
                ruleTitle: "I wish это:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: "PastSimple-9-0", text: " структура, выражающая сожаление о том, что что-то желаемое происходит не так, как мы хотим, или не происходит совсем и переводится как «жаль» и «как бы мне хотелось»."),
                    
                    Answer(id: "PastSimple-9-1", text: " структура, при помощи которой мы сообщаем о своих привычках в прошлом."),
                    
                    Answer(id: "PastSimple-9-2", text: " структура, при помощи которой мы критикуем чьи-то действия в прошлом."),
                    
                    Answer(id: "PastSimples-9-3", text: " структура, выражающая сожаление о том, что что-то желаемое в прошлом происходило не так, как мы хотели, или не происходило совсем.")
                    
                ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "I wish I lived near the sea. – Жаль, что я не живу возле моря. / Как бы мне хотелось жить возле моря."),
                    
                    RuleExample(text: " I wish I knew what to do about the problem. – Жаль, что я не знаю, как решить эту проблему. / Как бы мне хотелось знать, как решить эту проблему."),
                    
                    RuleExample(text: " I wish you were here. – Жаль, что тебя здесь нет. / Как бы мне хотелось, чтобы ты здесь был. ")
                    
                    ].toRealmList()
                
            ),
            
            Question(
                
                id: "Past Simple-10",
                
                ruleTitle: "Past Simple это:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: "PastSimple-10-0", text: " конструкция It is time (пора), где Past Simple сообщает нам, что действие надо было выполнить, но этого до сих пор не сделали. Past Simple в этом случае обозначает ситуацию, происходящую в настоящем или будущем. "),
                    
                    Answer(id: "PastSimple-10-1", text: " конструкция It is time (пора), где Past Simple сообщает нам, что действие надо было выполнить, но этого до сих пор не сделали. Past Simple в этом случае обозначает ситуацию, произошедшую в прошлом. "),
                    
                    Answer(id: "PastSimple-10-2", text: " конструкция It is time (пора), где Past Simple сообщает нам, что действие надо было выполнить, и оно было выполнено. "),
                    
                    Answer(id: "PastSimples-10-3", text: " конструкция It is time (пора), где Past Simple сообщает нам, что действие было выполнено до определенного момента в прошлом. ")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "It is time we left for the station. The train leaves in two hours. - Пора бы нам ехать на вокзал. Поезд отходит через два часа."),
                    
                    RuleExample(text: "It is high time you settled down and found a job! - Пора бы тебе уже взяться за ум и найти работу!"),
                    
                    RuleExample(text: " It’s high time she cleaned her room. Ей давно пора убраться в комнате.")
                    
                    ].toRealmList()
                
            ),
            
            Question(
                
                id: "Past Simple-11",
                
                ruleTitle: "I wish это:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: "PastSimple-11-0", text: " структура, выражающая сожаление о том, что что-то желаемое происходит не так, как мы хотим, или не происходит совсем и переводится как «жаль» и «как бы мне хотелось»."),
                    
                    Answer(id: "PastSimple-11-1", text: " структура, при помощи которой мы сообщаем о своих привычках в прошлом."),
                    
                    Answer(id: "PastSimple-11-2", text: " структура, при помощи которой мы критикуем чьи-то действия в прошлом."),
                    
                    Answer(id: "PastSimples-11-3", text: " структура, выражающая сожаление о том, что что-то желаемое в прошлом происходило не так, как мы хотели, или не происходило совсем.")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "I wish I lived near the sea. – Жаль, что я не живу возле моря. / Как бы мне хотелось жить возле моря."),
                    
                    RuleExample(text: " I wish I knew what to do about the problem. – Жаль, что я не знаю, как решить эту проблему. / Как бы мне хотелось знать, как решить эту проблему."),
                    
                    RuleExample(text: " I wish you were here. – Жаль, что тебя здесь нет. / Как бы мне хотелось, чтобы ты здесь был. ")
                    
                    ].toRealmList()
                
            ),
            ].toRealmList()
        )]
}
