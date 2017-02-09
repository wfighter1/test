<?php
namespace Quanshi\MP4Convert;

use Psr\Log\LoggerInterface;
use Silex\Application;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Filesystem\Filesystem;


class ConvertCommand extends Command
{
    /**
     * @var TaskQueue
     */
    private $task_queue;

    /**
     * @var LoggerInterface
     */
    private $logger;

    /**
     * @var ConvertService
     */
    private $service;


    public function __construct(Application $app)
    {
        parent::__construct();
        $this->logger = $app['monolog'];
        $this->task_queue = $app['task_queue'];
        $this->service = $app['convert_service'];
    }


    protected function configure()
    {
        $this
            ->setName('quanshi:mp4convert')
            ->setDescription('MP4 Convert worker process')
        ;
    }


    protected function execute(InputInterface $input, OutputInterface $output)
    {
        set_time_limit(0);
        // use a nodejs supervisor to restart this worker


        //test begin
        try {
            $this->service->testTask();
        } catch (\Exception $ex) {
                $this->logger->error($ex->getMessage());
                $this->logger->info("testTask error");
            }

        //test end

/*while(true) {
        $task = $this->task_queue->getTask();
        $this->logger->info("Start Task: " . json_encode($task));
        $output->writeln("Start Task: " . json_encode($task));
        if ($task) {
            try {
                $this->service->runTask($task);
                $this->task_queue->doneTask($task['id']);
                $this->task_queue->notifyUniform($this->service->getLocalPath());
            } catch (\Exception $ex) {
                $this->logger->error($ex->getMessage());
                $this->task_queue->failTask($task['id']);
            }
        } else {
            $this->task_queue->notifyUniform($this->service->getLocalPath());
            $this->task_queue->cleanup();
            sleep(60);
        }
}*/
    }

}
