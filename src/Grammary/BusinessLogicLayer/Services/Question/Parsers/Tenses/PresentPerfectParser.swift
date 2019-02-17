//
//  PresentPerfectParser.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 2/17/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import Foundation

func parsePresentPerfect() -> [Rule] {
    return [Rule(
        id: "PresentPerfectRule",
        ruleDescription: "Present Perfect",
        questions: [
            Question(
                
                id: "Present Perfect-0",
                
                ruleTitle: "Present Perfect построение утвердительных предложений:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: " PresentPerfect-0-0", text: " утвердительные предложения в Present Perfect строятся при помощи вспомогательного глагола have или has для he, she, it и основного глагола в третьей форме. "),
                    
                    Answer(id: "PresentPerfect-0-1", text: " утвердительные предложения в Present Perfect строятся при помощи вспомогательного глагола have или has для he, she, it и основного глагола во второй форме. "),
                    
                    Answer(id: "PresentPerfect-0-2", text: " утвердительные предложения в Present Perfect строятся при помощи вспомогательного глагола have или has для he, she, it и основного глагола с окончанием -ing. "),
                    
                    Answer(id: "PresentPerfect-0-3", text: " утвердительные предложения в Present Perfect строятся при помощи вспомогательного глагола have been или has been для he, she, it и основного глагола в третьей форме.")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "I have started my Science project. - Я начал свой проект по естественным наукам.)"),
                    
                    RuleExample(text: "He has decided to leave earlier. - Он решил уйти пораньше.)"),
                    
                    RuleExample(text: "They have come to mutual agreement. - Они пришли к обоюдному согласию.)")
                    
                    ].toRealmList()
                
            ),
            
            Question(
                
                id: "Present Perfect-1",
                
                ruleTitle: "Present Perfect построение отрицательных предложений:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: " PresentPerfect-1-0", text: " отрицательные предложения в Present Perfect строятся при помощи вспомогательного глагола have или has для he, she, it, отрицательной частицы not и основного глагола в третьей форме."),
                    
                    Answer(id: "PresentPerfect-1-1", text: " отрицательные предложения в Present Perfect строятся при помощи вспомогательного глагола have или has для he, she, it, отрицательной частицы not и основного глагола во второй форме "),
                    
                    Answer(id: "PresentPerfect-1-2", text: " отрицательные предложения в Present Perfect строятся при помощи вспомогательного глагола have или has для he, she, it, отрицательной частицы not и основного глагола с окончанием -ing. "),
                    
                    Answer(id: "PresentPerfect-1-3", text: " отрицательные предложения в Present Perfect строятся при помощи вспомогательного глагола have been или has been для he, she, it, отрицательной частицы not и основного глагола в третьей форме.")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "I have not decide where to go on my summer holiday. - Я не решил куда поехать летом в отпуск.)"),
                    
                    RuleExample(text: "She has not done the birthday party shopping yet. – Она еще не закупила продукты к столу на день рождения.)"),
                    
                    RuleExample(text: "The washing machine has not turned off. Is anything wrong with it? – Стиральная машинка не отключилась. С ней что-то не так?)")
                    
                    ].toRealmList()
                
            ),
            
            Question(
                
                id: "Present Perfect-2",
                
                ruleTitle: "Present Perfect построение вопросительных предложений:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: " PresentPerfect-2-0", text: "для образования вопросительных предложений в Present Perfect на первое место выносится вспомогательный глагол have (has), затем подлежащее и основной глагол в третьей форме."),
                    
                    Answer(id: "PresentPerfect-2-1", text: " для образования вопросительных предложений в Present Perfect на первое место выносится вспомогательный глагол have (has), затем подлежащее и основной глагол во второй форме. "),
                    
                    Answer(id: "PresentPerfect-2-2", text: " для образования вопросительных предложений в Present Perfect на первое место выносится вспомогательный глагол have (has), затем подлежащее и основной глагол с окончанием -ing."),
                    
                    Answer(id: "PresentPerfect-2-3", text: " для образования вопросительных предложений в Present Perfect на первое место выносится вспомогательный глагол have (has), затем основной глагол в третьей форме и подлежащее.")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "Have you finished polishing the car? Have you managed to remove all the spots? – Вы закончили полировать автомобиль? Вам удалось убрать все пятна?)"),
                    
                    RuleExample(text: "Has he decided what to give her as a birthday present? - Он решил, что подарить ей на день рождения?)"),
                    
                    RuleExample(text: "Have they moved into a new flat? Have they sold their old house? - Они переехали в новую квартиру? Они продали свой старый дом?)")
                    
                    ].toRealmList()
                
            ),
            
            Question(
                
                id: "Present Perfect-3",
                
                ruleTitle: "Present Perfect это:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: " PresentPerfect-3-0", text: "это действие, которое уже совершилось и мы видим его результат. На результат действия указывают наречия already, yet, just."),
                    
                    Answer(id: "PresentPerfect-3-1", text: " это действие, которое совершилось в прошлом и никак не связано с настоящим. "),
                    
                    Answer(id: "PresentPerfect-3-2", text: " это действие, которое уже совершилось и мы знаем точно, когда оно совершилось. На это указывают наречия времени yesterday, last."),
                    
                    Answer(id: "PresentPerfect-3-3", text: " это действие, которое происходит в данный момент. На это указывают наречия now, at the moment.")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "I know Jane. We have already met. - Я знаком с Джейн, мы уже встречались. (мы встречались в прошлом, поэтому, как результат, сейчас я ее знаю))"),
                    
                    RuleExample(text: "I don’t want to go to the café, I’ve just eaten. - Я не хочу идти в кафе, я только что поел. (я не голодный, это результат того, что я недавно ел))"),
                    
                    RuleExample(text: "Have you been to the new supermarket yet? Have you already seen its grand beauty? - Ты уже была в новом супермаркете? Ты уже видела его величественную красоту?)")
                    
                    ].toRealmList()
                
            ),
            
            Question(
                
                id: "Present Perfect-4",
                
                ruleTitle: "Present Perfect это:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: " PresentPerfect-4-0", text: "время, при помощи которого мы сообщаем о личном опыте. Наречия ever (когда-нибудь) и never (никогда) показывают, что мы делали или не делали в нашей жизни."),
                    
                    Answer(id: "PresentPerfect-4-1", text: " время, при помощи которого мы сообщаем о привычках в прошлом. "),
                    
                    Answer(id: "PresentPerfect-4-2", text: " время, при помощи которого мы сообщаем о действиях, произошедших в прошлом и никак не связанных с настоящим."),
                    
                    Answer(id: "PresentPerfect-4-3", text: " время, при помощи которого мы сообщаем о наших планах в настоящем.")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "I’ve been to England twice but I haven’t been to Scotland. - Я был в Англии дважды, но не был в Шотландии. (на данный момент моей жизни я посетил Англию и не успел посетить Шотландию, но я все еще надеюсь там побывать))"),
                    
                    RuleExample(text: "I have eaten in this restaurant many times. That`s quite a place. - Я ел в этом ресторане много раз. Это, надо сказать, хорошее место.)"),
                    
                    RuleExample(text: "I have never eaten mango. I`m not sure, I will like it. - Я никогда не ел манго. И не уверен, что он мне понравится.)"),
                    
                    ].toRealmList()
                
            ),
            
            Question(
                
                id: "Present Perfect-5",
                
                ruleTitle: "Present Perfect это:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: " PresentPerfect-5-0", text: " длительное действие, которое началось в прошлом, продолжается в настоящем и, возможно, будет продолжаться в будущем. Употребляется с предлогами for (в течение) и since (с тех пор как, начиная с) и глаголами состояния, которые не используются с временами группы Continuous."),
                    
                    Answer(id: "PresentPerfect-5-1", text: " длительное действие, которое началось в прошлом, продолжается в настоящем и, возможно, будет продолжаться в будущем. Употребляется с предлогами for (в течение) и since (с тех пор как, начиная с) и глаголами движения."),
                    
                    Answer(id: "PresentPerfect-5-2", text: " действие, которое длилось в прошлом и употребляется с предлогами for (в течение) и since (с тех пор как, начиная с)."),
                    
                    Answer(id: "PresentPerfect-5-3", text: " действие, которое длилось в прошлом, но закончилось к настоящему моменту. Употребляется с предлогами for (в течение) и since (с тех пор как, начиная с) и глаголами состояния, которые не используются с временами группы Continuous.")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "We’ve known each other since school years. We`ve been friends for 25 years, so to say. - Мы знаем друг друга со школы. Мы уже, так сказать, дружим 25 лет.)"),
                    
                    RuleExample(text: "I’ve studied English for 5 years. I`ve learnt about 5000 words. - Я учу английский в течение 5 лет. Я выучил около 5 000 слов. (я начал 5 лет назад, продолжаю сейчас и, возможно, буду учить в будущем)"),
                    
                    RuleExample(text: " I haven’t heard of him for the last 3 years. He hasn`t dropped me a line since then.– Я о нем ничего не слышал последние три года. Он не написал мне ни строчки с тех пор.)"),
                    
                    ].toRealmList()
                
            ),
            
            Question(
                
                id: "Present Perfect-6",
                
                ruleTitle: "Present Perfect это:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: " PresentPerfect-6-0", text: " время, когда необходимо подчеркнуть, сколько раз выполнялось действие. Для этого используется конструкция it is (that is) the first/second/third time something has happened - это первый/второй/третий раз, как что-то произошло."),
                    
                    Answer(id: "PresentPerfect-6-1", text: " время, когда необходимо подчеркнуть, сколько раз выполнялось действие. "),
                    
                    Answer(id: "PresentPerfect-6-2", text: " время, когда необходимо подчеркнуть, сколько раз выполнялось действие. Для этого используется конструкция it was (that was) the first/second/third time something has happened это первый/второй/третий раз, как что-то произошло."),
                    
                    Answer(id: "PresentPerfect-6-3", text: " время, когда необходимо подчеркнуть, сколько раз будет выполняться действие. Для этого используется конструкция it is (that is) the first/second/third time something has happened это первый/второй/третий раз, как что-то произошло.")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "It is the first time I have driven a car. = I have never driven a car before. - Я в первый раз водил машину.)"),
                    
                    RuleExample(text: "That is the fifth time Bill has phoned his girlfriend this evening. = He has called his girlfriend five times this evening. - Билл позвонил своей девушке уже пятый раз за вечер.)"),
                    
                    RuleExample(text: "This is the first time I have eaten sushi. I have never eaten sushi before. = Я впервые ем суши.)"),
                    
                    ].toRealmList()
                
            ),
            
            Question(
                
                id: "Present Perfect-7",
                
                ruleTitle: "Present Perfect это:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: " PresentPerfect-7-0", text: " время, которое может использоваться вместе с Past Simple в сложных предложениях с союзом since / ever since (с тех пор как) для действий, которые начались в определенное время в прошлом и продолжаются в настоящем. Главное предложение в Present Perfect, придаточное в Past Simple."),
                    
                    Answer(id: "PresentPerfect-7-1", text: " время, которое может использоваться вместе с Past Simple в сложных предложениях с союзом since / ever since (с тех пор как) для действий, которые начались в неопределенное время в прошлом и продолжаются в настоящем. Главное предложение в Present Perfect, придаточное в Past Simple. "),
                    
                    Answer(id: "PresentPerfect-7-2", text: " время, которое может использоваться вместе с Present Simple в сложных предложениях с союзом since / ever since (с тех пор как) для действий, которые начались в определенное время в прошлом и продолжаются в настоящем. Главное предложение в Present Perfect, придаточное в Present Simple."),
                    
                    Answer(id: "PresentPerfect-7-3", text: " время, которое может использоваться вместе с Past Simple в сложных предложениях с союзом since / ever since (с тех пор как) для действий, которые начались в определенное время в прошлом и продолжаются в настоящем. Главное предложение в Past Simple, придаточное в Present Perfect.")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "He hasn’t played the cello since he broke his bow.What a shame! - Он не играет на виолончели с тех пор, как сломал смычок. Какая жалость!)"),
                    
                    RuleExample(text: "I’ve lived like this ever since I moved to London. I like it a lot.- Я так живу с тех пор, как переехал в Лондон. И мне это нравится.)"),
                    
                    RuleExample(text: "Have you invited any of your friends since you moved into a new apartment? Have they been in here? - Ты приглашал кого-нибудь из друзей с тех пор, как переехал в новую квартиру? Они были здесь?)"),
                    
                    ].toRealmList()
                
            ),
            
            Question(
                
                id: "Present Perfect-8",
                
                ruleTitle: "Present Perfect это:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: " PresentPerfect-8-0", text: " время, которое используется в придаточных времени после союзов when (когда), as soon as (как только), until (пока не), before (до того как), after (после того как) для ситуаций в будущем. Мы используем Present Perfect с тем, чтобы показать, что действие в главном может быть выполнено, только если выполнить действие в придаточном. "),
                    
                    Answer(id: "PresentPerfect-8-1", text: " время, которое используется в придаточных времени после союзов when (когда), as soon as (как только), until (пока не), before (до того как), after (после того как) для ситуаций в настоящем. Мы используем Present Perfect с тем, чтобы показать, что действие в главном может быть выполнено, только если выполнить действие в придаточном. "),
                    
                    Answer(id: "PresentPerfect-8-2", text: " время, которое используется в придаточных времени после союзов when (когда), as soon as (как только), until (пока не), before (до того как), after (после того как) для ситуаций в будущем. Мы используем Present Perfect с тем, чтобы показать, что действие в придаточном может быть выполнено, только если выполнить действие в главном. "),
                    
                    Answer(id: "PresentPerfect-8-3", text: " время, которое используется в придаточных времени после союзов when (когда), as soon as (как только), until (пока не), before (до того как), after (после того как) для ситуаций в прошлом.")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "After he has graduated from Harvard, he will find a promising job. - После того как он окончит Гарвард, он устроится на перспективную работу.)"),
                    
                    RuleExample(text: "As soon as I’ve got to the station I’ll buy the tickets. I`ll call you afterwards. - Как только я приеду на станцию, я куплю билеты. Я позвоню тебе потом. (я смогу купить билеты, когда буду на станции, раньше не смогу)"),
                    
                    RuleExample(text: "I’ll call you when I’ve got home. - Я позвоню тебе, когда попаду домой. (я хочу подчеркнуть, что сначала я приду домой и только потом позвоню)"),
                    
                    ].toRealmList()
                
            ),
            
            Question(
                
                id: "Present Perfect-9",
                
                ruleTitle: "Present Perfect это:",
                
                ruleSubject: "",
                
                correctAnswerIndex: 0,
                
                shuffleAnswers: true,
                
                answers: [
                    
                    Answer(id: " PresentPerfect-9-0", text: " это время для сообщения какой-либо новости, которая появилась недавно. Для сообщения большей информации деталей, используются времена группы Simple или Continuous."),
                    
                    Answer(id: "PresentPerfect-9-1", text: " это время для сообщения какой-либо новости из прошлого. Для сообщения большей информации деталей, используются времена группы Simple или Continuous. "),
                    
                    Answer(id: "PresentPerfect-9-2", text: " это время для сообщения какой-либо ожидаемой в будущем новости. Для сообщения большей информации деталей, используются времена группы Simple или Continuous."),
                    
                    Answer(id: "PresentPerfect-9-3", text: " это время для сообщения какой-либо новости, которая появилась недавно. Для сообщения большей информации деталей, используется также Present Perfect.")
                    
                    ].toRealmList(),
                
                examples: [
                    
                    RuleExample(text: "A pony has escaped from the zoo. Zookeepers were looking for it in the neighbourhood, but with no luck. The police found the pony at the far end of the city. It was walking in the park and was asking the passers-by for some treat. - Пони сбежал из зоопарка. Работники зоопарка искали его в окрестностях, но безуспешно. Полиция обнаружила пони на другом конце города. Он гулял в парке и просил угощения у прохожих.)"),
                    
                    RuleExample(text: "Deadly tornado has hit Cuba. At least three people died and more than 170 others were injured. The residents were abandoning their homes. – Жуткий торнадо обрушился на Кубу. По крайней мере три человека погибли, более 170 получили ранения. Жители покидали свои дома. )"),
                    
                    RuleExample(text: " The Flash star has married the physical therapist. Talent manager Robert Stein shared a photo of the newlyweds at their reception via Instagram. Grant and LA were smiling happily surrounded by their family and friends. – Звезда шоу «Молния» женился на физиотерапевте. Менеджер шоу талантов Роберт Штейн поделился фотографией молодоженов в своем Инстаграме. Грант и ЛА счастливо улыбались в окружении семьи и друзей.)"),
                    
                    
                    
                    ].toRealmList()
                
            ),
            ].toRealmList()
        )]
}
