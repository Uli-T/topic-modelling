MALLET_DIR=mallet-2.0.7

TIME_COMMAND="/usr/bin/time -a -v -o maarten_time_output.txt"
INPUT_DIR=test_input
OUTPUT_DIR=test_output

TOPIC_NUMBER=50
WORD_NUMBER=20
THRESHOLD=0.1

${TIME_COMMAND} ${MALLET_DIR}/bin/mallet import-dir \
    --input ${INPUT_DIR} \
    --output ${INPUT_DIR}/topic-input.mallet \
    --keep-sequence --remove-stopwords TRUE\
    --stoplist-file ${MALLET_DIR}/stoplists/nl.txt \
    --skip-html TRUE

${TIME_COMMAND} ${MALLET_DIR}/bin/mallet train-topics \
    --input ${INPUT_DIR}/topic-input.mallet \
    --num-topics ${TOPIC_NUMBER} \
    --output-state ${OUTPUT_DIR}/topic-state.gz \
    --output-model ${OUTPUT_DIR}/topic-model.mallet \
    --output-doc-topics ${OUTPUT_DIR}/topic-docs.txt \
    --output-topic-keys ${OUTPUT_DIR}/topic-keys.txt \
    --num-top-words ${WORD_NUMBER} \
    --doc-topics-threshold ${THRESHOLD}
