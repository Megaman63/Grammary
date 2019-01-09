//
//  AnswersParser.swift
//  Grammary
//
//  Created by Сергей Гребеножко on 27/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import Foundation
import RealmSwift

var str = """
acknowledge    She acknowledged receiving assistance.
accuse of    He was accused of smuggling contraband goods.
admit    They admitted falsifying the data.
advise    The author advises undertaking further study.
anticipate    He anticipates having trouble with his supervisor.
appreciate    I appreciated having a chance to read your draft.
avoid    He avoided answering my rule.
complete    I finally completed writing my thesis.
consider    They will consider granting you money.
defer    She deferred writing her report.
delay    We delayed reporting the results until we were sure.
deny    They denied copying the information.
discuss    They discussed running the experiments again.
entail    This review procedure entails repeating the test.
look after    He will look after mailing the tickets.
insist on    He insisted on proofreading the article again.
involve    This procedure involves testing each sample twice.
justify    My results justify taking drastic action.
mention    The author mentions seeing this event.
plan on    They had planned on attending the conference.
postpone    The committee has postponed writing the report.
recall    I cannot recall getting those results before.
resent    He resented spending so much time on the project.
recommend    She recommends reading Marx.
resist    The writer resists giving any easy answers.
risk    She risks losing her viewing time.
sanction    They will not sanction copying without permission.
suggest    I suggest repeating the experiment.
take care of    He will take care of sending it to you.
tolerate    She can’t tolerate waiting for results.
"""

var str1 = """
afford    We cannot afford to hesitate.
agree    The professors agreed to disagree.
appear    The results appear to support your theory.
arrange    They had arranged to meet at noon.
beg    I beg to differ with you.
care    Would you care to respond?
claim    She claims to have new data.
consent    Will you consent to run for office?
decide    When did he decide to withdraw?
demand    I demand to see the results of the survey.
deserve    She deserves to have a fair hearing.
expect    The committee expects to decide by tomorrow.
fail    The trial failed to confirm his hypothesis.
hesitate    I hesitate to try the experiment again.
hope    What do you hope to accomplish?
learn    We have learned to proceed with caution.
manage    How did she manage to find the solution?
neglect    The author neglected to provide an index.
need    Do we need to find new subjects?
offer    We could offer to change the time of the meeting.
plan    They had planned to attend the conference.
prepare    He was not prepared to give a lecture.
pretend    I do not pretend to know the answer.
promise    They promise to demonstrate the new equipment.
refuse    She refused to cooperate any longer.
seem    Something seems to be wrong with your design.
struggle    We struggled to understand her point of view.
swear    He swears to tell the truth.
threaten    The team threatened to stop their research.
volunteer    Will you volunteer to lead the group?
wait    We could not wait to hear the outcome.
want    She did not want to go first.
wish    Do you wish to participate?
ask    I must ask you to reconsider your statement.
beg    They begged her to stay for another term.
cause    His findings caused him to investigate further.
challenge    Wilkins challenged Watson to continue the research.
convince    Can we convince them to fund our study?
encourage    She encouraged him to look beyond the obvious.
expect    They did not expect us to win an award.
forbid    The author forbade me to change his wording.
force    They cannot force her to reveal her sources.
hire    Did the department hire him to teach the new course?
instruct    I will instruct her to prepare a handout.
invite    We invite you to attend the ceremony.
need    They need her to show the slides.
order    He ordered the group to leave the building.
persuade    Can we persuade you to contribute again?
remind    Please remind him to check the references.
require    They will require you to submit an outline.
teach    We should teach them to follow standard procedures.
tell    Did she tell him to make three copies?
urge    I urge you to read the instructions before you begin.
want    I do not want you to have an accident.
warn    Why didn’t they warn me to turn down the heat?
"""

func parse() {
    guard let realm = try? Realm(), realm.objects(RulesSet.self).count == 0 else {
        return
    }
    
    var i = 0
    let gerundRules = str
        .components(separatedBy: "\n")
        .map { s -> Rule in
            let row = s.components(separatedBy: "    ")
            i = i + 1
            return Rule(
                id: "\(i)",
                ruleDescription: "",
                questions: [
                    Question(
                        id: "\(i)-\(0)",
                        ruleTitle: "Following a verb (gerund or infinitive)",
                        ruleSubject: row[0],
                        correctAnswer: 1,
                        shuffleAnswers: false,
                        answers: [
                            Answer(id: "\(i)-0", text: "Infinitive with to"),
                            Answer(id: "\(i)-1", text: "Gerund"),
                            Answer(id: "\(i)-2", text: "Infinitive without to")
                            ].toRealmList(),
                        examples: [RuleExample(text: row[1])].toRealmList()
                    )
                    ].toRealmList()
            )
    }
    let infinitiveRules = str1
        .components(separatedBy: "\n")
        .map { s -> Rule in
            let row = s.components(separatedBy: "    ")
            i = i + 1
            return Rule(
                id: "\(i)",
                ruleDescription: "",
                questions: [
                    Question(
                        id: "\(i)-\(0)",
                        ruleTitle: "Following a verb (gerund or infinitive)",
                        ruleSubject: row[0],
                        correctAnswer: 0,
                        shuffleAnswers: false,
                        answers: [
                            Answer(id: "\(i)-0", text: "Infinitive with to"),
                            Answer(id: "\(i)-1", text: "Gerund"),
                            Answer(id: "\(i)-2", text: "Infinitive without to")
                            ].toRealmList(),
                        examples: [RuleExample(text: row[1])].toRealmList()
                    )
                    ].toRealmList()
            )
    }
    var rules = gerundRules + infinitiveRules

    rules = rules.shuffled().shuffled()
    
    let partCount = rules.count / 10
    for i in 0..<partCount {
        let lastIndex = i * 10 + 10 < rules.count ? i * 10 + 10 :  rules.count
        let progress = rules[i * 10..<lastIndex].map { RuleProgress(rule: $0, reliableProgress: 6) }
        let set = RulesSet(id: "\(i)",
                               name: "Gerund or Infinitive. Part \(i+1)",
                               progress: progress.toRealmList())
        
        try? realm.write {
            realm.add(set, update: true)
        }
    }
    let conditionalProgress = parseConditional().map { RuleProgress(rule: $0, reliableProgress: 15)}
    let conditionalSet = RulesSet(id: "c-1",
                       name: "Conditional clauses",
                       progress: conditionalProgress.toRealmList())

    let articlesProgress = articles().map { RuleProgress(rule: $0, reliableProgress: 15)}
    let articlesSet = RulesSet(id: "a-1",
                       name: "Articles",
                       progress: articlesProgress.toRealmList())
    
    try? realm.write {
        realm.add(articlesSet, update: true)
        realm.add(conditionalSet, update: true)
    }
}

func parseConditional() -> [Rule] {
    let zero = Rule(
        id: "c-z",
        ruleDescription: "Zero Conditional",
        questions: [
            Question(
                id: "c-z-0",
                ruleTitle: "Zero conditional construction",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-z-0-0", text: "If clause - if + Any present tense. Main clause - Present Simple "),
                    Answer(id: "c-z-0-1", text: "If clause - if + Any present tense. Main clause - Any future form + infinitive without to"),
                    Answer(id: "c-z-0-2", text: "If clause - if + Any past tense. Main clause - would/could/might + infinitive without to"),
                    Answer(id: "c-z-0-3", text: "If clause - if + Past Perfect/Past Perfect Continious. Main clause - would/could/should/might have have + past participle")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "If you cut your finger with a knife, it hurts. – Если порезать палец ножом, он болит."),
                    RuleExample(text: "Snow melts if the temperature rises above zero. – Снег тает, если температура поднимается выше нуля."),
                    ].toRealmList()
            ),
            Question(
                id: "c-z-1",
                ruleTitle: "Выберите правильное суждение",
                ruleSubject: "Условные предложения Zero Conditional...",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-z-1-0", text: "всегда являются 100% истинной"),
                    Answer(id: "c-z-1-1", text: "выражают реальные, возможные ситуации в настоящем или будущем"),
                    Answer(id: "c-z-1-2", text: "выражают действия, совершение которых в определенных ситуациях в настоящем и будущем оказывается нереальным"),
                    Answer(id: "c-z-1-3", text: "выражают воображаемые ситуации, относящиеся к прошлому")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "If you cut your finger with a knife, it hurts. – Если порезать палец ножом, он болит."),
                    RuleExample(text: "Snow melts if the temperature rises above zero. – Снег тает, если температура поднимается выше нуля."),
                    ].toRealmList()
            ),
            Question(
                id: "c-z-2",
                ruleTitle: "Какая форма используется в Main clause конуструкции Zero Conditional?",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-z-2-0", text: "Present Simple"),
                    Answer(id: "c-z-2-1", text: "Past Simple"),
                    Answer(id: "c-z-2-2", text: "Any future form + infinitive without to"),
                    Answer(id: "c-z-2-3", text: "would/could/might + infinitive without to")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "If you cut your finger with a knife, it hurts. – Если порезать палец ножом, он болит."),
                    RuleExample(text: "Snow melts if the temperature rises above zero. – Снег тает, если температура поднимается выше нуля."),
                    ].toRealmList()
            ),
            Question(
                id: "c-z-3",
                ruleTitle: "Какая форма используется в If clause конуструкции Zero Conditional?",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-z-3-0", text: "Present Simple"),
                    Answer(id: "c-z-3-1", text: "Past Simple"),
                    Answer(id: "c-z-3-2", text: "Past Perfect"),
                    Answer(id: "c-z-3-3", text: "would/could/might + infinitive without to")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "If you cut your finger with a knife, it hurts. – Если порезать палец ножом, он болит."),
                    RuleExample(text: "Snow melts if the temperature rises above zero. – Снег тает, если температура поднимается выше нуля."),
                    ].toRealmList()
            ),
            Question(
                id: "c-z-4",
                ruleTitle: "Какой Conditional также используется для того, чтобы дать указания или инструкции?",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-z-4-0", text: "Zero conditional"),
                    Answer(id: "c-z-4-1", text: "Second conditional"),
                    Answer(id: "c-z-4-2", text: "Third conditional"),
                    Answer(id: "c-z-4-3", text: "First conditional")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "If you don’t want to be late, hurry up. – Если не хочешь опоздать, поторапливайся."),
                    RuleExample(text: "Take a nap if you feel tired. – Вздремни, если ты устал."),
                    ].toRealmList()
            )
            ].toRealmList()
    )
    let first = Rule(
        id: "c-f",
        ruleDescription: "Zero Conditional",
        questions: [
            Question(
                id: "c-f-0",
                ruleTitle: "First conditional construction",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-f-0-0", text: "If clause - if + Any present tense. Main clause - Any future form + infinitive without to"),
                    Answer(id: "c-f-0-1", text: "If clause - if + Any present tense. Main clause - Present Simple "),
                    Answer(id: "c-f-0-2", text: "If clause - if + Any past tense. Main clause - would/could/might + infinitive without to"),
                    Answer(id: "c-f-0-3", text: "If clause - if + Past Perfect/Past Perfect Continious. Main clause - would/could/should/might have have + past participle")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "You will find a good job if you study well. – Ты найдешь хорошую работу, если будешь хорошо учиться."),
                    RuleExample(text: "If the weather is good, we’ll walk our dogs in the park. – Если погода будет хорошей, мы пойдем выгуливать собак в парке."),
                    ].toRealmList()
            ),
            Question(
                id: "c-f-0-e",
                ruleTitle: "First Conditional sentences",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-f-0-e-0", text: "are used to talk about a possible present or future situation and its result"),
                    Answer(id: "c-f-0-e-1", text: "are used to talk about hypothetical or improbable situations in the present or future"),
                    Answer(id: "c-f-0-e-2", text: "are used to talk about a hypothetical situation in the past")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "They won’t get a table unless they’ve already booked."),
                    RuleExample(text: "Can I borrow your dictionary for a moment if you’re not using it?"),
                    ].toRealmList()
            ),
            Question(
                id: "c-f-1",
                ruleTitle: "Выберите правильное суждение",
                ruleSubject: "Условные предложения First Conditional...",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-f-1-0", text: "выражают реальные, возможные ситуации в настоящем или будущем"),
                    Answer(id: "c-f-1-1", text: "всегда являются 100% истинной"),
                    Answer(id: "c-f-1-2", text: "выражают действия, совершение которых в определенных ситуациях в настоящем и будущем оказывается нереальным"),
                    Answer(id: "c-f-1-3", text: "выражают воображаемые ситуации, относящиеся к прошлому")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "You will find a good job if you study well. – Ты найдешь хорошую работу, если будешь хорошо учиться."),
                    RuleExample(text: "If the weather is good, we’ll walk our dogs in the park. – Если погода будет хорошей, мы пойдем выгуливать собак в парке."),
                    ].toRealmList()
            ),
            Question(
                id: "c-f-2",
                ruleTitle: "Какая форма используется в Main clause конуструкции First Conditional?",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-f-2-0", text: "Any future form + infinitive without to"),
                    Answer(id: "c-f-2-1", text: "Present Simple"),
                    Answer(id: "c-f-2-2", text: "Past Simple"),
                    Answer(id: "c-f-2-3", text: "would/could/might + infinitive without to")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "You will find a good job if you study well. – Ты найдешь хорошую работу, если будешь хорошо учиться."),
                    RuleExample(text: "If the weather is good, we’ll walk our dogs in the park. – Если погода будет хорошей, мы пойдем выгуливать собак в парке."),
                    ].toRealmList()
            ),
            Question(
                id: "c-f-3",
                ruleTitle: "Какая форма используется в If clause конуструкции First Conditional?",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-f-3-0", text: "Present Simple"),
                    Answer(id: "c-f-3-1", text: "Past Simple"),
                    Answer(id: "c-f-3-2", text: "Past Perfect"),
                    Answer(id: "c-f-3-3", text: "Future Simple")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "You will find a good job if you study well. – Ты найдешь хорошую работу, если будешь хорошо учиться."),
                    RuleExample(text: "If the weather is good, we’ll walk our dogs in the park. – Если погода будет хорошей, мы пойдем выгуливать собак в парке."),
                    ].toRealmList()
            ),
            Question(
                id: "c-f-4",
                ruleTitle: "Какой Conditional часто используется, если мы хотим предупредить или предостеречь от чего-либо?",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-f-4-0", text: "First conditional"),
                    Answer(id: "c-f-4-1", text: "Second conditional"),
                    Answer(id: "c-f-4-2", text: "Third conditional"),
                    Answer(id: "c-f-4-3", text: "Zero conditional")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "You will get into trouble if you continue to hang out with her. – Ты попадешь в неприятности, если продолжишь общаться с ней."),
                    RuleExample(text: "If you drink much coffee, you won’t sleep at night. – Если ты будешь пить много кофе, то не будешь спать ночью."),
                    ].toRealmList()
            ),
            
            ].toRealmList()
    )
    
    let second = Rule(
        id: "c-s",
        ruleDescription: "Second Conditional",
        questions: [
            Question(
                id: "c-s-0",
                ruleTitle: "Second conditional construction",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-s-0-0", text: "If clause - if + Any past tense. Main clause - would/could/might + infinitive without to"),
                    Answer(id: "c-s-0-1", text: "If clause - if + Any present tense. Main clause - Present Simple "),
                    Answer(id: "c-s-0-1", text: "If clause - if + Any present tense. Main clause - Any future form + infinitive without to"),
                    Answer(id: "c-s-0-3", text: "If clause - if + Past Perfect/Past Perfect Continious. Main clause - would/could/should/might have have + past participle")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "If I were a billionaire, I would buy an island. – Если бы я был миллиардером, я бы купил остров."),
                    RuleExample(text: "If I lived in the countryside, I would walk in the forest every day. – Если бы я жил за городом, я бы гулял в лесу каждый день.")
                    ].toRealmList()
            ),
            Question(
                id: "c-s-0-e",
                ruleTitle: "Second Conditional sentences",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-s-0-e-0", text: "are used to talk about hypothetical or improbable situations in the present or future"),
                    Answer(id: "c-s-0-e-1", text: "are used to talk about a possible present or future situation and its result"),
                    Answer(id: "c-s-0-e-2", text: "are used to talk about a hypothetical situation in the past")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "If he were taller, he'd be accepted into the team."),
                    RuleExample(text: "She would still be correcting my grammar if she were alive.")
                    ].toRealmList()
            ),
            Question(
                id: "c-s-1",
                ruleTitle: "Выберите правильное суждение",
                ruleSubject: "Условные предложения Second Conditional...",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-s-1-0", text: "выражают действия, совершение которых в определенных ситуациях в настоящем и будущем оказывается нереальным"),
                    Answer(id: "c-s-1-1", text: "выражают реальные, возможные ситуации в настоящем или будущем"),
                    Answer(id: "c-s-1-2", text: "всегда являются 100% истинной"),
                    Answer(id: "c-s-1-3", text: "выражают воображаемые ситуации, относящиеся к прошлому")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "If I were a billionaire, I would buy an island. – Если бы я был миллиардером, я бы купил остров."),
                    RuleExample(text: "If I lived in the countryside, I would walk in the forest every day. – Если бы я жил за городом, я бы гулял в лесу каждый день.")
                    ].toRealmList()
            ),
            Question(
                id: "c-s-2",
                ruleTitle: "Какая форма используется в Main clause конуструкции Second Conditional?",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-s-2-0", text: "would/could/might + infinitive without to"),
                    Answer(id: "c-s-2-1", text: "Any future form + infinitive without to"),
                    Answer(id: "c-s-2-2", text: "Present Simple"),
                    Answer(id: "c-s-2-3", text: "Past Simple")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "If I were a billionaire, I would buy an island. – Если бы я был миллиардером, я бы купил остров."),
                    RuleExample(text: "If I lived in the countryside, I would walk in the forest every day. – Если бы я жил за городом, я бы гулял в лесу каждый день.")
                    ].toRealmList()
            ),
            Question(
                id: "c-s-3",
                ruleTitle: "Какая форма используется в If clause конуструкции Second Conditional?",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-s-3-0", text: "Past Simple"),
                    Answer(id: "c-s-3-1", text: "Present Simple"),
                    Answer(id: "c-s-3-2", text: "Past Perfect"),
                    Answer(id: "c-s-3-3", text: "Future Simple")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "If I were a billionaire, I would buy an island. – Если бы я был миллиардером, я бы купил остров."),
                    RuleExample(text: "If I lived in the countryside, I would walk in the forest every day. – Если бы я жил за городом, я бы гулял в лесу каждый день.")
                    ].toRealmList()
            ),
            Question(
                id: "c-s-4",
                ruleTitle: "Какой Conditional используется для того чтобы дать совет",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-s-4-0", text: "Second conditional"),
                    Answer(id: "c-s-4-1", text: "First conditional"),
                    Answer(id: "c-s-4-2", text: "Third conditional"),
                    Answer(id: "c-s-4-3", text: "Zero conditional")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "I would never do this if I were you. – Я бы никогда этого не сделал, если бы был тобой."),
                    RuleExample(text: "If I were in a tricky situation, I would take this opportunity. – Если бы я попал в сложную ситуацию, я бы воспользовался этой возможностью.")
                    ].toRealmList()
            ),
            ].toRealmList()
    )
    
    let third = Rule(
        id: "c-t",
        ruleDescription: "Third Conditional",
        questions: [
            Question(
                id: "c-t-0",
                ruleTitle: "Third conditional construction",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-t-0-0", text: "If clause - if + Past Perfect/Past Perfect Continious. Main clause - would/could/should/might have have + past participle"),
                    Answer(id: "c-t-0-1", text: "If clause - if + Any past tense. Main clause - would/could/might + infinitive without to"),
                    Answer(id: "c-t-0-2", text: "If clause - if + Any present tense. Main clause - Present Simple "),
                    Answer(id: "c-t-0-3", text: "If clause - if + Any present tense. Main clause - Any future form + infinitive without to")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "If I hadn’t missed the bus, I wouldn’t have been late for work. – Если бы я не опоздал на автобус, я бы не опоздал на работу."),
                    RuleExample(text: "If he had been more diligent, he would have been promoted long time ago. – Если бы он был более ответственный, его бы давно повысили.")
                    ].toRealmList()
            ),
            Question(
                id: "c-t-0-e",
                ruleTitle: "Third Conditional sentences",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-t-0-e-0", text: "are used to talk about a hypothetical situation in the past"),
                    Answer(id: "c-t-0-e-1", text: "are used to talk about hypothetical or improbable situations in the present or future"),
                    Answer(id: "c-t-0-e-2", text: "are used to talk about a possible present or future situation and its result"),
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "I would have bought it if they’d had it in my size."),
                    RuleExample(text: "If you’d been looking where you were going, you wouldn’t have tripped.")
                    ].toRealmList()
            ),
            Question(
                id: "c-t-1",
                ruleTitle: "Выберите правильное суждение",
                ruleSubject: "Условные предложения Third Conditional...",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-t-1-0", text: "выражают воображаемые ситуации, относящиеся к прошлому"),
                    Answer(id: "c-t-1-1", text: "выражают действия, совершение которых в определенных ситуациях в настоящем и будущем оказывается нереальным"),
                    Answer(id: "c-t-1-2", text: "выражают реальные, возможные ситуации в настоящем или будущем"),
                    Answer(id: "c-t-1-3", text: "всегда являются 100% истинной")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "If I hadn’t missed the bus, I wouldn’t have been late for work. – Если бы я не опоздал на автобус, я бы не опоздал на работу."),
                    RuleExample(text: "If he had been more diligent, he would have been promoted long time ago. – Если бы он был более ответственный, его бы давно повысили.")
                    ].toRealmList()
            ),
            Question(
                id: "c-t-2",
                ruleTitle: "Какая форма используется в Main clause конуструкции Third Conditional?",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-s-2-0", text: "would/could/might + infinitive without to"),
                    Answer(id: "c-s-2-1", text: "Any future form + infinitive without to"),
                    Answer(id: "c-s-2-2", text: "Present Simple"),
                    Answer(id: "c-s-2-3", text: "Past Simple")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "If I hadn’t missed the bus, I wouldn’t have been late for work. – Если бы я не опоздал на автобус, я бы не опоздал на работу."),
                    RuleExample(text: "If he had been more diligent, he would have been promoted long time ago. – Если бы он был более ответственный, его бы давно повысили.")
                    ].toRealmList()
            ),
            Question(
                id: "c-t-3",
                ruleTitle: "Какая форма используется в If clause конуструкции Third Conditional?",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-t-3-0", text: "Past Perfect"),
                    Answer(id: "c-t-3-1", text: "Past Simple"),
                    Answer(id: "c-t-3-2", text: "Present Simple"),
                    Answer(id: "c-t-3-3", text: "Future Simple")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "If I hadn’t missed the bus, I wouldn’t have been late for work. – Если бы я не опоздал на автобус, я бы не опоздал на работу."),
                    RuleExample(text: "If he had been more diligent, he would have been promoted long time ago. – Если бы он был более ответственный, его бы давно повысили.")
                    ].toRealmList()
            ),
            Question(
                id: "c-t-4",
                ruleTitle: "Какой Conditional используется когда мы критикуем какие-то действия, которые произошли в прошлом и которые мы не можем уже изменить?",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-t-4-0", text: "Third conditional"),
                    Answer(id: "c-t-4-1", text: "Second conditional"),
                    Answer(id: "c-t-4-2", text: "First conditional"),
                    Answer(id: "c-t-4-3", text: "Zero conditional")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "If you had listened carefully, you wouldn’t have made so many mistakes. – Если бы ты внимательно слушал, ты бы не допустил так много ошибок."),
                    RuleExample(text: "If you hadn’t left your car opened, it wouldn’t have been stolen. – Если бы ты не оставил машину открытой, ее бы не угнали.")
                    ].toRealmList()
            ),
            Question(
                id: "c-t-5",
                ruleTitle: "Какой Conditional используется когда хотим сообщить о хороших событиях, которые произошли в прошлом и положительно повлияли на наше настоящее.?",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-t-4-0", text: "Third conditional"),
                    Answer(id: "c-t-4-1", text: "Second conditional"),
                    Answer(id: "c-t-4-2", text: "First conditional"),
                    Answer(id: "c-t-4-3", text: "Zero conditional")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "He wouldn’t have made this discovery if he hadn’t done precise calculations. – Он не совершил бы это открытие, если бы не сделал очень точные расчеты."),
                    RuleExample(text: "If I hadn’t taken the wrong way, I wouldn’t have met you. – Если бы я не пошел по неправильной дороге, я бы не встретил тебя.")
                    ].toRealmList()
            ),
            Question(
                id: "c-t-6",
                ruleTitle: "Какой Conditional используется в случае когда-то в прошлом что-то произошло, мы об этом сожалеем, но изменить событие уже не можем?",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-t-4-0", text: "Third conditional"),
                    Answer(id: "c-t-4-1", text: "Second conditional"),
                    Answer(id: "c-t-4-2", text: "First conditional"),
                    Answer(id: "c-t-4-3", text: "Zero conditional")
                    ].toRealmList(),
                examples: [
                    RuleExample(text: "He wouldn’t have made this discovery if he hadn’t done precise calculations. – Он не совершил бы это открытие, если бы не сделал очень точные расчеты."),
                    RuleExample(text: "If I hadn’t taken the wrong way, I wouldn’t have met you. – Если бы я не пошел по неправильной дороге, я бы не встретил тебя.")
                    ].toRealmList()
            ),
            
            ].toRealmList()
    )
    
    return [zero, first, second, third]
    
}




func articles() -> [Rule] {
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
        ruleDescription: "Indefinite article",
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
