//
//  PresentSimpleParser.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 2/17/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import Foundation

func parsePresentSimple() -> [Rule] {
    return [Rule(
        id: "PresentSimpleRule",
        ruleDescription: "Present Simple",
        questions: [
            Question(
                id: "Present Simple -0",
                ruleTitle: "Present Simple построение утвердительных предложений:",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "Present Simple-0-0", text: "утвердительные предложения в Present Simple строятся с помощью основного глагола без частицы to, а для местоимений he, she, it добавляется окончание -s (-es)."),
                    Answer(id: "Present Simple-0-1", text: "утвердительные предложения в Present Simple строятся с помощью основного глагола без частицы to."),
                    Answer(id: "Present Simple-0-2", text: "утвердительные предложения в Present Simple строятся с помощью вспомогательного глагола be (am, is, are) и основного глагола без частицы to."),
                    Answer(id: "Present Simple-0-3", text: "утвердительные предложения в Present Simple строятся с помощью вспомогательного глагола do (для he, she, it – does) и основного глагола без частицы to.")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "I get up at 6 in the morning and drive to the office - Я встаю в 6 часов утра и еду в офис.)"),
                    RuleExample(text: "Peter never has lunch at work. - Петр никогда не обедает на работе.)"),
                    RuleExample(text: "They play tennis every day. - Они каждый день играют в теннис.)")
                    ].toRealmList()
            ),
            
            Question(
                id: "Present Simple -1",
                ruleTitle: "Present Simple построение отрицательных предложений:",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "Present Simple-1-0", text: "отрицательные предложения в Present Simple строятся при помощи вспомогательного глагола do (does для he, she, it), отрицательной частицы not и начальной формы основного глагола."),
                    Answer(id: "Present Simple -1-1", text: "отрицательные предложения в Present Simple строятся при помощи вспомогательных глаголов am, is, are, отрицательной частицы not и начальной формы основного глагола."),
                    Answer(id: "Present Simple -1-2", text: "отрицательные предложения в Present Simple строятся при помощи вспомогательного глагола do, отрицательной частицы not и начальной формы основного глагола."),
                    Answer(id: "Present Simple-1-3", text: "отрицательные предложения в Present Simple строятся при помощи вспомогательного глагола do (does для he, she, it), отрицательной частицы not и основного глагола с окончанием -s.")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "She doesn’t like the weather in London — Ей не нравится погода в Лондоне.)"),
                    RuleExample(text: "People don`t speak Arabic here. — Здесь никто не говорит по-арабски.)"),
                    RuleExample(text: "They don’t drink beer. — Они не пьют пиво.)")
                    ].toRealmList()
            ),
            
            Question(
                id: "Present Simple-2",
                ruleTitle: "Present Simple построение вопросительных предложений:",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "Present Simple-2-0", text: "для образования вопросительных предложений в Present Simple на первое место выносится вспомогательный глагол do (для he, she, it - does), затем подлежащее и начальная форма основного глагола."),
                    Answer(id: "Present Simple-2-1", text: "для образования вопросительных предложений в Present Simple на первое место выносится вспомогательный глагол do, затем подлежащее и начальная форма основного глагола."),
                    Answer(id: "Present Simple -2-2", text: "для образования вопросительных предложений в Present Simple на первое место выносятся вспомогательные глаголы am, is, are, затем подлежащее и начальная форма основного глагола."),
                    Answer(id: "Present Simple-2-3", text: "для образования вопросительных предложений в Present Simple на первое место выносится вспомогательный глагол do (для he, she, it - does), затем подлежащее и основной глагол с окончанием -s.")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "What languages does she speak? - На каких языках она говорит?)"),
                    RuleExample(text: "Where does he live in Prague? — Где он живет в Праге?)"),
                    RuleExample(text: "Does she play in a band? — Она играет в группе?)")
                    ].toRealmList()
            ),
            Question(
                id: "Present Simple-3",
                ruleTitle: "Present Simple это:",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                complexity: "A1",
                answers: [
                    Answer(id: "Present Simple -3-0", text: "действия, обозначающие состояния, привычные или повторяющиеся действие, ежедневная рутина. "),
                    Answer(id: "Present Simple-3-1", text: "действия, происходящие в данный момент речи. "),
                    Answer(id: "Present Simple -3-2", text: "действия, которые произошли в неопределенный момент речи. "),
                    Answer(id: "Present Simple-3-3", text: "действия, которые произойдут в ближайшем будущем. ")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "I always close the window in the evening.  Я всегда закрываю окно вечером. (привычка закрывать окно по вечерам)"),
                    RuleExample(text: "I take a bus to work every morning.  Я езжу на работу на автобусе каждое утро. (ежедневная рутина)"),
                    RuleExample(text: "I usually get tired at work. – Я обычно устаю на работе. I am tired now. – Я сейчас уставшая. (состояние)")
                    ].toRealmList()
            ),
            Question(
                id: "Present Simple-4",
                ruleTitle: "Present Simple это:",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                complexity: "B1",
                answers: [
                    Answer(id: "Present Simple-4-0", text: "время, передающее законы природы, научные факты, общепринятые утверждения в настоящем."),
                    Answer(id: "Present Simple-4-1", text: "время, передающее законы природы, научные факты, общепринятые утверждения в прошлом. "),
                    Answer(id: "Present Simple-4-2", text: "время, передающее предположения в будущем. "),
                    Answer(id: "Present Simple-4-3", text: "действия, происходящие в данный момент речи. ")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "The sun rises in the east.  Солнце всходит на востоке. (закон природы)"),
                    RuleExample(text: "Boys don’t cry.  Мальчики не плачут. (общепринятое утверждение)"),
                    RuleExample(text: " Do koalas live in Australia?  Коалы живут в Австралии? Yes, they do. They live in Australia.  Да, коалы живут в Австралии. (всем известный факт)"),
                    ].toRealmList()
            ),
            
            Question(
                id: "Present Simple-5",
                ruleTitle: "Present Simple это:",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                complexity: "B2",
                answers: [
                    Answer(id: "Present Simple-5-0", text: "время, используемое в рецептах, инструкциях и руководствах вместо повелительного наклонения для перечисления нескольких действий, следующих друг за другом."),
                    Answer(id: "Present Simple-5-1", text: "время, используемое для перечисления нескольких действий, следовавших друг за другом в прошлом. "),
                    Answer(id: "Present Simple-5-2", text: "время, используемое для цепочки действий, которые произойдут в будущем. "),
                    Answer(id: "Present Simple-5-3", text: "время, используемое для описания событий, происходящих в личной жизни. ")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "We mix flour and eggs. We add a pinch of sugar. We bake a cake at 200 degrees.  Смешиваем муку и яйца, добавляем щепотку сахара. Выпекаем пирог при температуре 200 градусов.)"),
                    RuleExample(text: "Smartphone connects to the Internet using a Wi-Fi connection. You choose a network and your smartphone connects to this network.  Смартфон подключается к Интернету при помощи Wi-Fi соединения. Вы выбираете сеть, и ваш смартфон соединяется с этой сетью.)"),
                    RuleExample(text: "To brush your teeth you aim the toothbrush at a 45 degree angle towards the gum line. You use a pea-sized amount of toothpaste. You use a gentle circular motion. – Чтобы почистить зубы, держите зубную щетку под углом в 45 градусов. Используйте зубную пасту размером с горошину. Совершайте плавные круговые движения.)"),
                ].toRealmList()
            ),
            
            Question(
                id: "Present Simple-6",
                ruleTitle: "Present Simple это:",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                complexity: "B2",
                answers: [
                    Answer(id: "Present Simple-6-0", text: "время, используемое в расписаниях движения транспорта, сеансов в кинотеатре, занятий и т. д."),
                    Answer(id: "Present Simple-6-1", text: "время, используемое для запланированных действий. "),
                    Answer(id: "Present Simple-6-2", text: "время, используемое для сообщения намерений."),
                    Answer(id: "Present Simple-6-3", text: "время, используемое для прогнозирования каких-либо событий.")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "The train leaves at 5 a.m. Don’t miss it.  Поезд отходит в 5 утра. Смотри не опоздай. )"),
                    RuleExample(text: "The school classes begin at 8.30.  Школьные занятия начинаются в 8:30.) "),
                    RuleExample(text: "The airplane takes off at 4.30 am — Самолет взлетит в 4.30 утра.)"),
                ].toRealmList()
            ),
            
            Question(
                id: "Present Simple-7",
                ruleTitle: "Present Simple это:",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                complexity: "C1",
                answers: [
                    Answer(id: "Present Simple-7-0", text: "несколько действий, которые происходят одно за другим в спортивных обзорах и комментариях."),
                    Answer(id: "Present Simple-7-1", text: "несколько действий, которые точно будут происходить одно за другим в спортивных обзорах и комментариях "),
                    Answer(id: "Present Simple-7-2", text: "предположительные действий, которые будут происходить в спортивных обзорах и комментариях "),
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "The forward takes the ball but he misses and hits the post.  Нападающий принимает мяч, но промахивается и бьет в штангу.)"),
                    RuleExample(text: "The horse number 5 overtakes the favourite and enters the homestretch.  Лошадь под номером 5 обгоняет фаворита и выходит на финишную прямую.)"),
                    RuleExample(text: "The ball hits the net, and she loses the point. – Мяч ударяется в сетку и она теряет очко.)"),
                ].toRealmList()
            ),
            
            Question(
                id: "Present Simple-8",
                ruleTitle: "Present Simple это:",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                complexity: "C1",
                answers: [
                    Answer(id: "Present Simple-8-0", text: "время, используемое в новостных сводках и заголовках газет в отношении прошедшего времени или будущего (но с указанием точного момента в будущем). "),
                    Answer(id: "Present Simple-8-1", text: "время, используемое в новостных сводках и заголовках газет в отношении будущего времени без указания точного момента. "),
                    Answer(id: "Present Simple-8-2", text: "время, используемое в новостных сводках и заголовках газет в качестве прогнозирования каких-то событий. "),
                    Answer(id: "Present Simple-8-3", text: "время, используемое в новостных сводках и заголовках газет для описания событий, произошедших в далеком прошлом. ")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "Amazon receives Patent for Drone Delivery System.  Компания Amazon получила патент на систему доставки товара с помощью дронов. (заголовок)"),
                    RuleExample(text: "The Foreign Secretary of England meets the ambassador of France to start the negotiations.  Министр иностранных дел Англии встретил посла Франции для переговоров. (новостная сводка)"),
                    RuleExample(text: "Next week the Foreign Secretary of England meets the ambassador of France to start the negotiations.  На следующей неделе министр иностранных дел Англии встретится с послом Франции для переговоров.)"),
                ].toRealmList()
            ),
            
            Question(
                id: "Present Simple-9",
                ruleTitle: "Present Simple это:",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                complexity: "A2",
                answers: [
                    Answer(id: "Present Simple-9-0", text: "время, используемое в условных предложениях нулевого типа (Zero Conditional), когда мы говорим о законах природы, научных фактах, общепринятых утверждениях. "),
                    Answer(id: "Present Simple-9-1", text: "время, используемое в условных предложениях нулевого типа (Zero Conditional), когда мы сожалеем о действиях, совершенных в прошлом. "),
                    Answer(id: "Present Simple-9-2", text: "время, используемое в условных предложениях нулевого типа (Zero Conditional), когда мы говорим о реальных действиях в будущем. "),
                    Answer(id: "Present Simple-9-3", text: "время, используемое в условных предложениях второго типа (Second Conditional), когда мы говорим о законах природы, научных фактах, общепринятых утверждениях. ")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "If you freeze water, it becomes ice.  Если заморозить воду, она превращается в лед. )"),
                    RuleExample(text: "If it rains, the roads are slippery.  Если идет дождь, дороги скользкие. )"),
                    RuleExample(text: "If you don`t water plants regularly, they get dry and die. – Если цветы не поливать регулярно, то они засыхают и погибают.)"),
                ].toRealmList()
            ),
            Question(
                id: "Present Simple-10",
                ruleTitle: "Present Simple это:",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                complexity: "A2",
                answers: [
                    Answer(id: "Present Simple-10-0", text: "время, используемое в придаточном предложении в условном наклонении первого типа (First Conditional), когда мы говорим о реальных действиях, которые могут произойти в будущем при определенных условиях. "),
                    Answer(id: "Present Simple-10-1", text: "время, используемое в главном предложении в условном наклонении первого типа (First Conditional), когда мы говорим о реальных действиях, которые могут произойти в будущем. "),
                    Answer(id: "Present Simple-10-2", text: "время, используемое в условном наклонении первого типа (First Conditional), когда мы говорим о реальных действиях, которые могут произойти в будущем. "),
                    Answer(id: "Present Simple-10-3", text: "время, используемое в условных предложениях второго типа (Second Conditional), когда мы выражаем сожаление о прошлом. ")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "If you eat a lot of sweets, you will have problems with your teeth. — Если ты будешь есть много сладостей, у тебя будут проблемы с зубами. )"),
                    RuleExample(text: "I will speak with Tom, if I find him. — Я поговорю с Томом, если найду его. )"),
                    RuleExample(text: "We will have a hike if the weather is fine. - Если погода будет хорошей, мы сходим в поход.)"),
                ].toRealmList()
            ),
            
            Question(
                id: "Present Simple-11",
                ruleTitle: "Present Simple это:",
                ruleSubject: "",
                correctAnswerIndex: 0,
                shuffleAnswers: true,
                complexity: "B2",
                answers: [
                    Answer(id: "Present Simple-11-0", text: "время, используемое  в придаточных предложениях времени после союзов when (когда), until (пока не) или as soon as (как только), если действие относится к будущему времени."),
                    Answer(id: "Present Simple-11-1", text: "время, используемое  в главных предложениях с придаточным времени после союзов when (когда), until (пока не) или as soon as (как только), если действие относится к будущему времени "),
                    Answer(id: "Present Simple-11-2", text: "время, используемое  в придаточных предложениях времени после союзов when (когда), until (пока не) или as soon as (как только), если действие относится к настоящему времени "),
                    Answer(id: "Present Simple-11-3", text: "время, используемое  в придаточных предложениях условия после союзов when (когда), until (пока не) или as soon as (как только), если действие относится к настоящему времени ")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "When I see Jim, I will say hi to him.  Когда я увижу Джима, я передам ему привет.)"),
                    RuleExample(text: "I will stay at home until he comes back.  Я буду дома, пока он не вернется.)"),
                    RuleExample(text: "As soon as I get to the airport, I’ll call you.  Как только я доберусь до аэропорта, я позвоню тебе.)"),
                ].toRealmList()
            ),
            ].toRealmList()
        )]
}
