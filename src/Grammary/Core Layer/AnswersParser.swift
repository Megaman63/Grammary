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
                            ].toRealmList()
                    )
                    ].toRealmList(),
                examples: [RuleExample(text: row[1])].toRealmList()
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
                            ].toRealmList()
                    )
                    ].toRealmList(),
                examples: [RuleExample(text: row[1])].toRealmList()
            )
    }
    var rules = gerundRules + infinitiveRules

    rules = rules.shuffled().shuffled()
    
    let partCount = rules.count / 10
    for i in 0..<partCount {
        let lastIndex = i * 10 + 10 < rules.count ? i * 10 + 10 :  rules.count
        let progress = rules[i * 10..<lastIndex].map { RuleProgress(rule: $0) }
        let set = RulesSet(id: "\(i)",
                               name: "Gerund or Infinitive. Part \(i+1)",
                               progress: progress.toRealmList())
        let realm = try? Realm()
        try? realm?.write {
            realm?.add(set, update: true)
        }
    }
    
    let progress = parseConditional().map { RuleProgress(rule: $0 )}
    let set = RulesSet(id: "c-1",
                       name: "Conditional clauses",
                       progress: progress.toRealmList())
    let realm = try? Realm()
    try? realm?.write {
        realm?.add(set, update: true)
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
                    Answer(id: "c-z-0-0", text: "If clause - if + Present Simple. Main clause - Present Simple "),
                    Answer(id: "c-z-0-1", text: "If clause - if + Present Simple. Main clause - Future Simple + infinitive without to"),
                    Answer(id: "c-z-0-2", text: "If clause - if + Past Simple. Main clause - would + infinitive without to"),
                    Answer(id: "c-z-0-3", text: "If clause - if + Past Perfect. Main clause - would (could, should, might) have + past participle")
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
                    Answer(id: "c-z-2-2", text: "Future Simple + infinitive without to"),
                    Answer(id: "c-z-2-3", text: "would + infinitive without to")
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
                    Answer(id: "c-z-3-3", text: "would + infinitive without to")
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
                    ].toRealmList()
            ),
            ].toRealmList(),
        examples: [
            RuleExample(text: "If you cut your finger with a knife, it hurts. – Если порезать палец ножом, он болит."),
            RuleExample(text: "If temperature is zero, water freezes. – Если температура равна нулю, вода замерзает. "),
            
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
                    Answer(id: "c-f-0-0", text: "If clause - if + Present Simple. Main clause - Future Simple + infinitive without to"),
                    Answer(id: "c-f-0-1", text: "If clause - if + Present Simple. Main clause - Present Simple "),
                    Answer(id: "c-f-0-2", text: "If clause - if + Past Simple. Main clause - would + infinitive without to"),
                    Answer(id: "c-f-0-3", text: "If clause - if + Past Perfect. Main clause - would (could, should, might) have + past participle")
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
                    ].toRealmList()
            ),
            Question(
                id: "c-f-2",
                ruleTitle: "Какая форма используется в Main clause конуструкции First Conditional?",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-f-2-0", text: "Future Simple + infinitive without to"),
                    Answer(id: "c-f-2-1", text: "Present Simple"),
                    Answer(id: "c-f-2-2", text: "Past Simple"),
                    Answer(id: "c-f-2-3", text: "would + infinitive without to")
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
                    ].toRealmList()
            ),
            
            ].toRealmList(),
        examples: [
            RuleExample(text: "You will find a good job if you study well. – Ты найдешь хорошую работу, если будешь хорошо учиться."),
            RuleExample(text: "If the weather is good, we’ll walk our dogs in the park. – Если погода будет хорошей, мы пойдем выгуливать собак в парке.")
            
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
                    Answer(id: "c-s-0-0", text: "If clause - if + Past Simple. Main clause - would + infinitive without to"),
                    Answer(id: "c-s-0-1", text: "If clause - if + Present Simple. Main clause - Present Simple "),
                    Answer(id: "c-s-0-1", text: "If clause - if + Present Simple. Main clause - Future Simple + infinitive without to"),
                    Answer(id: "c-s-0-3", text: "If clause - if + Past Perfect. Main clause - would (could, should, might) have + past participle")
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
                    ].toRealmList()
            ),
            Question(
                id: "c-s-2",
                ruleTitle: "Какая форма используется в Main clause конуструкции Second Conditional?",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-s-2-0", text: "would + infinitive without to"),
                    Answer(id: "c-s-2-1", text: "Future Simple + infinitive without to"),
                    Answer(id: "c-s-2-2", text: "Present Simple"),
                    Answer(id: "c-s-2-3", text: "Past Simple")
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
                    ].toRealmList()
            ),
            ].toRealmList(),
        examples: [
            RuleExample(text: "If I were a billionaire, I would buy an island. – Если бы я был миллиардером, я бы купил остров."),
            RuleExample(text: "If I lived in the countryside, I would walk in the forest every day. – Если бы я жил за городом, я бы гулял в лесу каждый день.")
            
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
                    Answer(id: "c-t-0-0", text: "If clause - if + Past Perfect. Main clause - would (could, should, might) have + past participle"),
                    Answer(id: "c-t-0-1", text: "If clause - if + Past Simple. Main clause - would + infinitive without to"),
                    Answer(id: "c-t-0-2", text: "If clause - if + Present Simple. Main clause - Present Simple "),
                    Answer(id: "c-t-0-3", text: "If clause - if + Present Simple. Main clause - Future Simple + infinitive without to")
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
                    ].toRealmList()
            ),
            Question(
                id: "c-t-2",
                ruleTitle: "Какая форма используется в Main clause конуструкции Third Conditional?",
                ruleSubject: "",
                correctAnswer: 0,
                shuffleAnswers: true,
                answers: [
                    Answer(id: "c-s-2-0", text: "would + infinitive without to"),
                    Answer(id: "c-s-2-1", text: "Future Simple + infinitive without to"),
                    Answer(id: "c-s-2-2", text: "Present Simple"),
                    Answer(id: "c-s-2-3", text: "Past Simple")
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
                    ].toRealmList()
            ),
            
            ].toRealmList(),
        examples: [
            RuleExample(text: "If I hadn’t missed the bus, I wouldn’t have been late for work. – Если бы я не опоздал на автобус, я бы не опоздал на работу."),
            RuleExample(text: "If he had been more diligent, he would have been promoted long time ago. – Если бы он был более ответственный, его бы давно повысили.")
            
            ].toRealmList()
    )
    
    return [zero, first, second, third]
    
}




