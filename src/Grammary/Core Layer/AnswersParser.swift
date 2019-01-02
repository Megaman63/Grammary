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
avoid    He avoided answering my question.
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
    let gerundQuestions = str
        .components(separatedBy: "\n")
        .map { s -> Question in
            let row = s.components(separatedBy: "    ")
            i = i + 1
            return Question(
                id: "\(i)",
                questionTitle: "Following a verb (gerund or infinitive)",
                questionSubject: row[0],
                answers: [
                    Answer(id: "\(i)-0", text: "Infinitive with to"),
                    Answer(id: "\(i)-1", text: "Gerund"),
                    Answer(id: "\(i)-2", text: "Infinitive without to")
                ].toRealmList(),
                correctAnswer: 1,
                questionDescription: "",
                examples: [Example(text: row[1])].toRealmList()
            )
    }
    let infinitiveQuestions = str1
        .components(separatedBy: "\n")
        .map { s -> Question in
            let row = s.components(separatedBy: "    ")
            i = i + 1
            return Question(
                id: "\(i)",
                questionTitle: "Following a verb (gerund or infinitive)",
                questionSubject: row[0],
                answers: [
                    Answer(id: "\(i)-0", text: "Infinitive with to"),
                    Answer(id: "\(i)-1", text: "Gerund"),
                    Answer(id: "\(i)-2", text: "Infinitive without to")
                ].toRealmList(),
                correctAnswer: 0,
                questionDescription: "",
                examples: [Example(text: row[1])].toRealmList()
            )
    }
    var questions = gerundQuestions + infinitiveQuestions

    questions = questions.shuffled().shuffled()
    
    let progress = questions.map { QuestionProgress(question: $0) }
    let set = QuestionsSet(id: "0",
                           name: "Gerund or Infinitive",
                           progress: progress.toRealmList())
    let realm = try? Realm()
    try? realm?.write {
        realm?.add(set, update: true)
    }
}

