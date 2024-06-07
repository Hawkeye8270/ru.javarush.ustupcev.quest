package service;

import model.Question;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class QuestionServiceTest {

    @Test
    void getQuestionById() {

        Question question = new Question();
        question.setId(2);
        question.setStep("Ты принял вызов!");
        question.setQuestion("Поднимешься на мостик к капитану?");

        assertEquals(2, question.getId());
        assertEquals("Ты принял вызов!", question.getStep());
        assertEquals("Поднимешься на мостик к капитану?", question.getQuestion());

    }


}