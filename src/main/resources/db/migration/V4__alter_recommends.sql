ALTER TABLE Recommends
    ADD CONSTRAINT uq_recommend_criteria UNIQUE (
                                                 age, breed, size, weight_state, walking_state, sleeping_state);