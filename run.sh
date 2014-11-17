MALLET_DIR=mallet-2.0.7

INPUT_DIR=test_input
OUTPUT_DIR=test_output


${MALLET_DIR}/bin/mallet import-dir \
    --input ${INPUT_DIR} \
    --output ${INPUT_DIR}/topic-input.mallet \
    --keep-sequence --remove-stopwords TRUE\
    --stoplist-file ${MALLET_DIR}/stoplists/nl.txt \
    --skip-html TRUE

${MALLET_DIR}/bin/mallet train-topics \
    --input ${INPUT_DIR}/topic-input.mallet \
    --num-topics 50 \
    --output-state ${OUTPUT_DIR}/topic-state.gz \
    --output-model ${OUTPUT_DIR}/topic-model.mallet \
    --output-doc-topics ${OUTPUT_DIR}/topic-docs.txt \
    --output-topic-keys ${OUTPUT_DIR}/topic-keys.txt
