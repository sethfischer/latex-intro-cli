class RubberPipe
{
    private $texSource;
    private $pdf;

    public function execute() {
        $descriptorSpec = array(
            0 => array("pipe", "r"),
            1 => array("pipe", "w"),
            2 => array("pipe", "w")
        );

        $process = proc_open(
            "rubber-pipe --pdf --into /tmp/",
            $descriptorSpec,
            $pipes,
            $this->cwd,
            $this->env
        );

        if (is_resource($process)) {
            fwrite($pipes[0], $this->texSource);
            fclose($pipes[0]);
            $this->pdf = stream_get_contents($pipes[1]);
        }
    }
}
